import 'package:rws_app/translation/generated/l10n.dart';
import 'package:flutter/material.dart';

enum MainMenuEnum { home, users, settings, about, report, language }

extension MainMenuEnumExtension on MainMenuEnum {
  String getTitle(BuildContext context) {
    switch (this) {
      case MainMenuEnum.home:
        return S.of(context).home;
      case MainMenuEnum.users:
        return S.of(context).user_name;
      case MainMenuEnum.settings:
        return S.of(context).title_settings;
      case MainMenuEnum.about:
        return S.of(context).about_app;
      case MainMenuEnum.report:
        return S.of(context).report;
      case MainMenuEnum.language:
        return S.of(context).language;
    }
  }

  IconData getIconData() {
    switch (this) {
      case MainMenuEnum.home:
        return Icons.home;
      case MainMenuEnum.users:
        return Icons.supervised_user_circle;
      case MainMenuEnum.settings:
        return Icons.settings;
      case MainMenuEnum.about:
        return Icons.info;
      case MainMenuEnum.report:
        return Icons.report;
      case MainMenuEnum.language:
        return Icons.language;
    }
  }

  String getRouteName() {
    return name;
  }
}
