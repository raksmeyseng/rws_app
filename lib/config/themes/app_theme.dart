import 'package:rws_app/core/modules/app/models/app_theme_options.dart';
import 'package:rws_app/utils/common_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rws_app/config/themes/dark_theme.dart';
import 'package:rws_app/config/themes/light_theme.dart';

abstract class AppTheme extends Equatable {
  const AppTheme(this.themeOptions);
  final AppThemeOptions? themeOptions;
  ThemeData get themeData;
  Widget get icon;
  String getKey();
}

class AppThemeFactory {
  static AppTheme buildTheme(String? key, {AppThemeOptions? themeOptions}) {
    switch (key) {
      case DarkTheme.key:
        return DarkTheme(themeOptions);
      case LightTheme.key:
        return LightTheme(themeOptions);
      default:
        return AutoTheme(themeOptions);
    }
  }

  static AppTheme toggleTheme(String? key, {AppThemeOptions? themeOptions}) {
    switch (key) {
      case DarkTheme.key:
        return AutoTheme(themeOptions);
      case LightTheme.key:
        return DarkTheme(themeOptions);
      case AutoTheme.key:
        return LightTheme(themeOptions);
      default:
        return AutoTheme(themeOptions);
    }
  }
}

class DarkTheme extends AppTheme {
  static const String key = 'DarkTheme';
  const DarkTheme(AppThemeOptions? themeOptions) : super(themeOptions);

  @override
  ThemeData get themeData => darkTheme(themeOptions);

  @override
  Widget get icon => const Icon(Icons.dark_mode, key: Key('dark_mode'));

  @override
  String getKey() => key;

  @override
  List<Object?> get props => [themeData, icon, getKey()];
}

class LightTheme extends AppTheme {
  static const String key = 'LightTheme';
  const LightTheme(AppThemeOptions? themeOptions) : super(themeOptions);

  @override
  ThemeData get themeData => lightTheme(themeOptions);

  @override
  Widget get icon => const Icon(Icons.light_mode, key: Key('light_mode'));

  @override
  String getKey() => key;

  @override
  List<Object?> get props => [themeData, icon, getKey()];
}

class AutoTheme extends AppTheme {
  static const String key = 'AutoTheme';
  const AutoTheme(AppThemeOptions? themeOptions) : super(themeOptions);

  @override
  ThemeData get themeData {
    bool isDarkMode = isSytemDarkMode();
    return isDarkMode ? darkTheme(themeOptions) : lightTheme(themeOptions);
  }

  @override
  Widget get icon => const Icon(Icons.brightness_auto, key: Key('auto_mode'));

  @override
  String getKey() => key;

  @override
  List<Object?> get props => [themeData, icon, getKey()];
}
