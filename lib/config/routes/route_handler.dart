import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rws_app/core/modules/app/view/about_page.dart';
import 'package:rws_app/core/modules/change_password/view/change_password_page.dart';
import 'package:rws_app/core/modules/dashboard/view/dashboard_page.dart';
import 'package:rws_app/core/modules/edit_profile/view/edit_profile_page.dart';
import 'package:rws_app/core/modules/login/view/login_page.dart';
import 'package:rws_app/core/modules/not_found/not_found_screen.dart';
import 'package:rws_app/core/modules/register/view/register_page.dart';
import 'package:rws_app/core/modules/setting/view/setting_page.dart';
import 'package:rws_app/core/modules/splashscreen/splashscreen_page.dart';
import 'package:rws_app/core/modules/water_supply_details/view/water_supply_detials_page.dart';

extension ObjectExtension on Object? {
  dynamic getValue(String key, dynamic alt) {
    if (this == null) return alt;
    return (this as Map<String, dynamic>)[key] ?? alt;
  }
}

// ===================
// Core Builder
// ===================

Page splashscreenBuilder(BuildContext context, GoRouterState state) {
  final from = state.queryParams['from'];
  return MaterialPage<void>(
    key: state.pageKey,
    child: SplashScreenPage(nextRoute: from),
  );
}

Page settingBuilder(BuildContext context, GoRouterState state) {
  return MaterialPage<void>(
    key: state.pageKey,
    child: const SettingPage(),
  );
}

Page aboutBuilder(BuildContext context, GoRouterState state) {
  return MaterialPage<void>(
    key: state.pageKey,
    child: const AboutPage(),
  );
}

Page loginBuilder(BuildContext context, GoRouterState state) {
  return MaterialPage<void>(
    key: state.pageKey,
    child: const LoginPage(),
  );
}

Page dashboardBuilder(BuildContext context, GoRouterState state) {
  return MaterialPage<void>(
    key: state.pageKey,
    child: const DashboardPage(),
  );
}

Page changePasswordBuilder(BuildContext context, GoRouterState state) {
  return MaterialPage<void>(
    key: state.pageKey,
    child: const ChangePasswordPage(),
  );
}

Page notFoundBuilder(BuildContext context, GoRouterState state) {
  return MaterialPage<void>(
    key: state.pageKey,
    child: const NotFoundScreen(),
  );
}

Page registerBuilder(BuildContext context, GoRouterState state) {
  return MaterialPage<void>(
    key: state.pageKey,
    child: const RegisterPage(),
  );
}

Page editProfileBuilder(BuildContext context, GoRouterState state) {
  return MaterialPage<void>(
    key: state.pageKey,
    child: const EditProfilePage(),
  );
}

Page waterSupplyDetailBuilder(BuildContext context, GoRouterState state) {
  final id = int.tryParse(state.extra.getValue('id', '0'));
  final title = state.extra.getValue('title', '');
  return MaterialPage<void>(
    key: state.pageKey,
    child: WaterSupplyPage(
      waterSupplyId: id ?? 0,
      title: title,
    ),
  );
}
