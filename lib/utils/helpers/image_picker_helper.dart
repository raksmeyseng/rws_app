import 'dart:developer';

import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/widgets/flat_card.dart';
import 'package:rws_app/core/widgets/my_button.dart';
import 'package:rws_app/core/widgets/my_divider.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/core/widgets/wrapper.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:rws_app/utils/helpers/permission_helper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

enum PickingSourceEnum { camera, gallery, remove }

class ImagePickerHelper {
  static Future<XFile?> pickImage(
    BuildContext context, {
    bool hasProfile = false,
    bool needCrop = true,
  }) async {
    if (kIsWeb) {
      return _imgFromGalleryForWeb(needCrop: needCrop);
    }
    final source = await showModalBottomSheet<PickingSourceEnum?>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          child: FlatCard(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (!kIsWeb)
                  ListTile(
                    leading: const Icon(Icons.photo_camera_outlined),
                    title: TextWidget(S.of(context).title_camera),
                    onTap: () {
                      Navigator.of(context).pop(PickingSourceEnum.camera);
                    },
                  ),
                ListTile(
                  leading: const Icon(Icons.photo_library_outlined),
                  title: TextWidget(S.of(context).title_gallery),
                  onTap: () {
                    Navigator.of(context).pop(PickingSourceEnum.gallery);
                  },
                ),
                if (hasProfile) ...[
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: MyDivider(),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.delete_forever,
                      color: AppColor.danger,
                    ),
                    title: TextWidget(
                      S.of(context).title_remove_profile,
                      color: AppColor.danger,
                    ),
                    onTap: () {
                      Navigator.of(context).pop(PickingSourceEnum.remove);
                    },
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );

    switch (source) {
      case PickingSourceEnum.camera:
        return _imgFromCamera();
      case PickingSourceEnum.gallery:
        if (kIsWeb) {
          return _imgFromGalleryForWeb(needCrop: needCrop);
        }
        return _imgFromGallery();
      case PickingSourceEnum.remove:
        return XFile('');
      default:
        return null;
    }
  }

  static Future<List<XFile>?> pickMultiImage() async {
    final files = await ImagePicker().pickMultiImage(imageQuality: 50);
    return files;
  }

  static Future<XFile?> _imgFromCamera({bool needCrop = true}) async {
    try {
      final hasPermission = await PermissionHelper.requestCameraPermission();
      if (!hasPermission) {
        return null;
      }
      final image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.front,
      );
      if (!needCrop) {
        return image;
      }
      return _cropImaged(image?.path);
    } catch (e) {
      inspect(e);
      return Future.value();
    }
  }

  static Future<XFile?> _imgFromGallery({bool needCrop = true}) async {
    try {
      final hasPermission = await PermissionHelper.requestGalleryPermission();
      if (!hasPermission) {
        return null;
      }
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
      );
      if (!needCrop) {
        return image;
      }
      return _cropImaged(image?.path);
    } catch (e) {
      inspect(e);
      return Future.value();
    }
  }

  static Future<XFile?> _imgFromGalleryForWeb({bool needCrop = true}) async {
    final file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (!needCrop) {
      return file;
    }

    if (file == null) return null;
    final cropped = await _cropImaged(file.path);
    if (cropped == null) return null;
    final bytes = await cropped.readAsBytes();
    return XFile(
      cropped.path,
      name: file.name,
      bytes: bytes,
    );
  }

  static Future<XFile?> _cropImaged(String? filePath) async {
    if (filePath == null) return Future.value(null);
    final context = Application.context!;
    final cropped = await ImageCropper().cropImage(
      sourcePath: filePath,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      cropStyle: CropStyle.circle,
      uiSettings: [
        AndroidUiSettings(
          statusBarColor: Theme.of(context).primaryColor,
          toolbarColor: Theme.of(context).primaryColor,
          toolbarWidgetColor: AppColor.white,
          toolbarTitle: S.of(context).title_crop_image,
        ),
        IOSUiSettings(
          title: S.of(context).title_crop_image,
          cancelButtonTitle: S.of(context).button_cancel,
          doneButtonTitle: S.of(context).button_done,
        ),
        WebUiSettings(
          context: context,
          presentStyle: CropperPresentStyle.dialog,
          enableZoom: true,
          showZoomer: true,
          boundary: const CroppieBoundary(width: 400, height: 400),
          viewPort: const CroppieViewPort(width: 400, height: 400),
          customDialogBuilder: (cropper, crop, rotate) {
            return Dialog(
              insetPadding: const EdgeInsets.all(24.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Builder(
                builder: (context) {
                  return Wrapper(
                    center: false,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            color: Theme.of(context).primaryColor,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16.0,
                                    horizontal: 24.0,
                                  ),
                                  child: TextWidget(
                                    S
                                        .of(context)
                                        .title_crop_image
                                        .toUpperCase(),
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: ClipOval(
                                    child: Material(
                                      color: Colors.transparent,
                                      child: IconButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        color: Colors.white,
                                        iconSize: 20,
                                        icon: const Icon(Icons.close,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: SizedBox(
                              width: 400,
                              height: 400,
                              child: cropper,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: MyButton(
                              onPressed: () async {
                                final nav = Navigator.of(context);

                                /// it is important to call crop() function and return
                                /// result data to plugin, for example:
                                final result = await crop();
                                nav.pop(result);
                              },
                              maxWidth: 400,
                              title: S.of(context).button_done,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
    if (cropped == null) return null;
    final bytes = await cropped.readAsBytes();
    return XFile(cropped.path, bytes: bytes);
  }

  static Future<XFile?> pickSingleFile() async {
    if (kIsWeb) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      final file = result?.files.single;
      if (file != null) {
        return XFile(
          '',
          name: file.name,
          bytes: file.bytes,
        );
      } else {
        return null;
      }
    }
    throw 'Not implemented';
  }
}
