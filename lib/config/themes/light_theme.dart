import 'package:rws_app/core/modules/app/models/app_theme_options.dart';
import 'package:rws_app/utils/helpers/color_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/constants/app_constant.dart';

ThemeData lightTheme(AppThemeOptions? themeOptions) {
  Color primary = AppColor.primary;
  String font = AppConstant.defaultFont;
  if (themeOptions != null) {
    if (themeOptions.primaryColorHex != null) {
      primary = Color(ColorHelper.fromHexString(themeOptions.primaryColorHex!));
    }
    if (themeOptions.fontFamily != null) {
      font = themeOptions.fontFamily!;
    }
  }
  return ThemeData(
    //==================================
    // Color Section
    //==================================
    scaffoldBackgroundColor: AppColor.card,
    primaryColor: primary,
    secondaryHeaderColor: primary.withOpacity(.7),
    cardColor: AppColor.card,
    unselectedWidgetColor: Colors.grey,
    dividerColor: AppColor.divider,
    colorScheme: ColorScheme(
      primary: primary,
      secondary: AppColor.cardDark,
      brightness: Brightness.light,
      background: AppColor.background,
      error: AppColor.danger,
      onBackground: const Color(0xffB5BFD3),
      onError: AppColor.white,
      onPrimary: AppColor.white,
      onSecondary: AppColor.white,
      onSurface: Colors.black,
      surface: AppColor.primary,
    ),

    //==================================
    // Animate Navigation
    //==================================
    pageTransitionsTheme: kIsWeb
        ? const PageTransitionsTheme(builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
          })
        : null,

    //==================================
    // Brightness
    //==================================
    brightness: Brightness.light,

    //==================================
    // Font-Family
    //==================================
    fontFamily: font,

    timePickerTheme: TimePickerThemeData(
      backgroundColor: primary,
      dialBackgroundColor: primary,
    ),

    //==================================
    // Component Theming
    //==================================
    primaryIconTheme: IconThemeData(color: primary),
    buttonTheme: ButtonThemeData(buttonColor: primary),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(primary),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primary,
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 4.0,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primary,
        side: BorderSide(
          color: primary.withOpacity(.5),
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primary,
    ),
    iconTheme: const IconThemeData(color: AppColor.black),
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: AppColor.black.withOpacity(.5),
      labelColor: primary,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      // scrolledUnderElevation: .5,
      titleSpacing: 16,
      color: AppColor.card,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: primary,
        fontSize: 16,
      ),
      iconTheme: IconThemeData(color: primary, size: 20),
      actionsIconTheme: IconThemeData(color: primary, size: 20),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColor.card,
    ),
    dialogBackgroundColor: AppColor.card,
    dialogTheme: const DialogTheme(
      backgroundColor: AppColor.card,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(fontWeight: FontWeight.normal),
      prefixStyle: TextStyle(
        color: AppColor.textDark,
        fontWeight: FontWeight.bold,
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all<Color>(primary),
    ),
    textTheme: Typography.material2018(platform: defaultTargetPlatform)
        .black
        .copyWith(
          bodyLarge: const TextStyle(color: AppColor.textDark, fontSize: 14),
          bodyMedium: const TextStyle(color: AppColor.textDark, fontSize: 14),
          bodySmall: const TextStyle(color: AppColor.textLight, fontSize: 14),
          // headline1: const TextStyle(color: AppColor.black, fontSize: 96),
          // headline2: const TextStyle(color: AppColor.black, fontSize: 60),
          titleMedium: const TextStyle(
            color: AppColor.textDark,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: const TextStyle(
            color: AppColor.textDark,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          labelSmall: const TextStyle(color: AppColor.textDark, fontSize: 10),
          labelLarge: const TextStyle(color: AppColor.textDark, fontSize: 14),
        ),

    //==================================
    // Others Theming
    //==================================
    visualDensity: VisualDensity.adaptivePlatformDensity,
    platform: defaultTargetPlatform,
  );
}
