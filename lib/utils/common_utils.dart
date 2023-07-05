import 'dart:io';
import 'dart:ui' as ui;

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/config/themes/app_theme.dart';
import 'package:rws_app/core/modules/app/bloc/app_bloc.dart';
import 'package:rws_app/core/widgets/dialogs/confirm_dialog.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:rws_app/utils/helpers/color_helper.dart';
import 'package:rws_app/utils/helpers/dialog_helper.dart';
import 'package:rws_app/utils/helpers/image_saver_helper.dart';
import 'package:rws_app/utils/helpers/js/js_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

// ==============
// Constant values
// ==============
const double appButtonHeight = 45;
const double appButtonHeightDense = 40;
const double appContentMaxWidth = 768;
const double appSmallMaxWidth = 512;

/// Update statusbar color base on Material App Theme
// void updateStatusBarColor([Color? color]) {
//   final context = Application.router.navigator?.context;
//   if (context == null) return;

//   final theme = context.read<AppBloc>().state.theme;

//   SystemChrome.setSystemUIOverlayStyle(
//     SystemUiOverlayStyle(statusBarColor: color ?? theme.themeData.cardColor),
//   );
// }

bool isSytemDarkMode() {
  final brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
  return brightness == Brightness.dark;
}

void listenAndHandleSystemAppearanceChanged() {
  final window = SchedulerBinding.instance.platformDispatcher;
  window.onPlatformBrightnessChanged = () {
    final state = Application.appBloc.state;
    if (state.theme.getKey() == AutoTheme.key) {
      // Change themeData
      Application.appBloc.add(ThemeChanged(theme: state.theme));
    }
  };
}

bool isAppDarkMode() {
  final theme = Application.appBloc.state.theme;
  return theme.themeData.brightness == Brightness.dark;
}

/// Beautify cambodian phone
///
/// 012345678 => 012 345 678
///
/// 0123456789 => 012 345 6789
String phoneBeautify(String? phone) {
  if (phone == null) return '';

  final rawPhone = phone.replaceAll(' ', '');

  if (rawPhone.length < 9) return phone;

  final a = rawPhone.substring(0, 3);
  final b = rawPhone.substring(3, 6);
  final c = rawPhone.substring(6);
  return '$a $b $c';
}

TextWidget humanizedExpiredDate(
  BuildContext context,
  int? dueDay,
  String? colorHex,
) {
  if (dueDay == null || colorHex == null) return const TextWidget('-');
  final dueColor = Color(ColorHelper.fromHexString(colorHex));
  if (dueDay == 0) {
    return TextWidget(
      S.of(context).expired_today,
      color: dueColor,
    );
  } else if (dueDay > 0) {
    return TextWidget(
      dueDay <= 1
          ? S.of(context).count_single_day_to_be_expired_(dueDay)
          : S.of(context).count_plural_day_to_be_expired_(dueDay),
      color: dueColor,
    );
  } else {
    final days = dueDay * -1;
    return TextWidget(
      days <= 1
          ? S.of(context).count_single_day_expired_(days)
          : S.of(context).count_plural_day_expired_(days),
      color: dueColor,
    );
  }
}

Future<String> getTempPath() async {
  Directory appDocDir = await getTemporaryDirectory();
  return Future.value(appDocDir.path);
}

Future<void> captureAndSave(
  GlobalKey key, {
  String fileName = 'temp',
  double pixelRatio = 3.0,
}) async {
  final boundary =
      key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
  if (boundary == null) return;

  ui.Image image = await boundary.toImage(pixelRatio: pixelRatio);
  ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  final pngBytes = byteData!.buffer.asUint8List();

  final safeFileName = fileName.replaceAll('/', '_');

  if (kIsWeb) {
    return JsHelper().downloadFile(pngBytes, '$safeFileName.png');
  }

  final result = await ImageSaverHelper.saveImage(
    pngBytes,
    fileName: safeFileName,
  );

  if (!result.isSuccess) {
    throw 'Failed to save the file.';
  }

  // final path = await getTempPath();
  // final fullPath = '$path/$safeFileName';

  // await File(fullPath).writeAsBytes(pngBytes);
  // await Share.shareXFiles(
  //   [
  //     XFile(
  //       fullPath,
  //       mimeType: 'image/png',
  //       name: fileName,
  //     )
  //   ],
  //   sharePositionOrigin: sharePositionOrigin(key),
  // );
}

Rect? sharePositionOrigin(GlobalKey key) {
  final renderBox = key.currentContext?.findRenderObject() as RenderBox?;
  if (renderBox == null) return null;

  Size size = renderBox.size;
  Offset position = renderBox.localToGlobal(Offset.zero);

  return Rect.fromCenter(
    center: position + Offset(size.width / 2, size.height / 2),
    width: size.width,
    height: size.height,
  );
}

Future<Uint8List?> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(
    data.buffer.asUint8List(),
    targetWidth: width,
  );
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
      .buffer
      .asUint8List();
}

Future<void> openInMaps(double latitude, double longitude,
    [String? label]) async {
  final googleMapGeneralUri =
      Uri.parse('https://maps.google.com/?q=@$latitude,$longitude');
  final googleMapAndroidUri =
      Uri.parse('geo:0,0?q=$latitude,$longitude($label)');
  final googleMapIosUri =
      Uri.parse('comgooglemaps://?q=$label&center=$latitude,$longitude');
  final appleMapUri =
      Uri.parse('https://maps.apple.com/?q=$label&ll=$latitude,$longitude');

  final platform = Theme.of(Application.context!).platform;
  final isApple =
      platform == TargetPlatform.iOS || platform == TargetPlatform.macOS;

  if (platform == TargetPlatform.android) {
    try {
      await _launchUrl(googleMapAndroidUri);
    } catch (e) {
      _launchUrl(googleMapGeneralUri);
    }
  } else if (isApple && await canLaunchUrl(googleMapIosUri)) {
    _launchUrl(googleMapIosUri);
  } else if (isApple && await canLaunchUrl(appleMapUri)) {
    _launchUrl(appleMapUri);
  } else {
    _launchUrl(googleMapGeneralUri);
  }
}

Future<bool> _launchUrl(Uri uri) {
  return launchUrl(uri, mode: LaunchMode.externalApplication);
}

void copyTextToClipboard(BuildContext context, String text) {
  Clipboard.setData(ClipboardData(text: text));
  showSnackBar(context, '${S.of(context).copied} $text');
}

void showSnackBar(
  BuildContext context,
  String message, {
  Color? color,
  bool permanant = false,
}) {
  ScaffoldMessenger.of(context)
    ..clearSnackBars()
    ..showSnackBar(
      SnackBar(
        backgroundColor: color ?? AppColor.info,
        content: TextWidget(
          message,
          color: Colors.white,
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.fade,
        ),
        duration:
            permanant ? const Duration(days: 100) : const Duration(seconds: 4),
      ),
    );
}

String prettifyDuration(BuildContext context, int? minutes) {
  if (minutes == null) return '-';
  if (minutes < 60) {
    return minutes > 1
        ? S.of(context).count_plural_minute_(minutes)
        : S.of(context).count_single_minute_(minutes);
  } else if (minutes < 60 * 24) {
    final hours = minutes ~/ 60;
    return hours > 1
        ? S.of(context).count_plural_hour_(hours)
        : S.of(context).count_single_hour_(hours);
  } else {
    final days = minutes ~/ (60 * 24);
    return days > 1
        ? S.of(context).count_plural_day_(days)
        : S.of(context).count_single_day_(days);
  }
}

// close device's on-screen keyboard
void closeKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
  // SystemChannels.textInput.invokeMethod('TextInput.hide');
}

String enToKhmerPhone(String phone) {
  final value = phone.replaceAll(' ', '');
  final List<Map<String, String>> maps = [
    {
      'en': '0',
      'km': '០',
    },
    {
      'en': '1',
      'km': '១',
    },
    {
      'en': '2',
      'km': '២',
    },
    {
      'en': '3',
      'km': '៣',
    },
    {
      'en': '4',
      'km': '៤',
    },
    {
      'en': '5',
      'km': '៥',
    },
    {
      'en': '6',
      'km': '៦',
    },
    {
      'en': '7',
      'km': '៧',
    },
    {
      'en': '8',
      'km': '៨',
    },
    {
      'en': '9',
      'km': '៩',
    },
  ];
  final khmerPhone = value.split('').map((digit) {
    if (int.tryParse(digit) == null) return '';
    final item = maps.firstWhere((x) => x['en'] == digit || x['km'] == digit);
    return item['km'];
  }).join();

  return phoneBeautify(khmerPhone);
}

Future<Position?> getCurrentPosition() async {
  if (!kIsWeb) {
    final status = await Permission.location.request();
    if (status == PermissionStatus.permanentlyDenied) {
      final confirmed = await DialogHelper.showAnimatedDialog<bool?>(
        pageBuilder: (_, __, ___) {
          return ConfirmDialog(
            icon: const Icon(
              Icons.settings,
              size: 70,
              color: AppColor.white,
            ),
            title: S.current.location_permission,
            message: S.current.msg_allow_location_permission,
            confirmText: S.current.button_ok,
          );
        },
      );
      if (confirmed == true) {
        await openAppSettings();
      }
    }
    if (!status.isGranted) {
      return null;
    }
  }

  return Geolocator.getCurrentPosition();
}
