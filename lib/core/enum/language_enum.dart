import 'package:rws_app/constants/asset_path.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:flutter/material.dart';

enum LanguageEnum { khmer, english }

extension LanguageEnumExtension on LanguageEnum {
  Locale getLocale() {
    switch (this) {
      case LanguageEnum.khmer:
        return const Locale('km', 'KH');
      case LanguageEnum.english:
        return const Locale('en', 'US');
    }
  }

  String getDisplayText(BuildContext context) {
    switch (this) {
      case LanguageEnum.khmer:
        return 'ភាសាខ្មែរ';
      case LanguageEnum.english:
        return 'English';
    }
  }

  String getSubDisplayText(BuildContext context) {
    switch (this) {
      case LanguageEnum.khmer:
        return S.of(context).lang_khmer;
      case LanguageEnum.english:
        return S.of(context).lang_english;
    }
  }

  String getIconPath() {
    switch (this) {
      case LanguageEnum.khmer:
        return AssetPath.imgFlagKhmer;
      case LanguageEnum.english:
        return AssetPath.imgFlagEngland;
    }
  }
}
