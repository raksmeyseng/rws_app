import 'package:rws_app/translation/generated/l10n.dart';
import 'package:flutter/material.dart';

enum MainMenuEnum {
  account,
  setting,
  about,
}

extension MainMenuEnumExtension on MainMenuEnum {
  String getTitle(BuildContext context) {
    switch (this) {
      case MainMenuEnum.account:
        return S.of(context).account;
      case MainMenuEnum.setting:
        return S.of(context).title_settings;
      case MainMenuEnum.about:
        return S.of(context).about_app;
    }
  }

  IconData getIconData() {
    switch (this) {
      case MainMenuEnum.account:
        return Icons.person;
      case MainMenuEnum.setting:
        return Icons.settings;
      case MainMenuEnum.about:
        return Icons.info;
    }
  }

  String getRouteName() {
    return name;
  }
}
