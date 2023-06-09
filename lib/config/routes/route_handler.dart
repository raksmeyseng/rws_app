import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rws_app/core/modules/app/view/about_page.dart';
import 'package:rws_app/core/modules/change_password/view/change_password_page.dart';
import 'package:rws_app/core/modules/dashboard/view/dashboard_page.dart';
import 'package:rws_app/core/modules/edit_profile/view/edit_profile_page.dart';
import 'package:rws_app/core/modules/login/view/login_page.dart';
import 'package:rws_app/core/modules/my_task/view/my_task_page.dart';
import 'package:rws_app/core/modules/not_found/not_found_screen.dart';
import 'package:rws_app/core/modules/register/view/register_page.dart';
import 'package:rws_app/core/modules/report/view/report_page.dart';
import 'package:rws_app/core/modules/setting/view/setting_page.dart';
import 'package:rws_app/core/modules/splashscreen/splashscreen_page.dart';
import 'package:rws_app/core/modules/user_information/view/user_page.dart';
import 'package:rws_app/core/modules/view_details/view/list_data_details_page.dart';
import 'package:rws_app/core/modules/water_supplier_edit/view/water_supply_edit_page.dart';
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

Page usersBuilder(BuildContext context, GoRouterState state) {
  return MaterialPage<void>(
    key: state.pageKey,
    child: const AboutPage()// const UserPage(),
  );
}

Page aboutBuilder(BuildContext context, GoRouterState state) {
  return MaterialPage<void>(
    key: state.pageKey,
    child: const AboutPage(),
  );
}

Page reportBuilder(BuildContext context, GoRouterState state) {
  return MaterialPage<void>(
    key: state.pageKey,
    child: const ReportPage(),
  );
}

Page loginBuilder(BuildContext context, GoRouterState state) {
  return MaterialPage<void>(
    key: state.pageKey,
    child: const LoginPage(),
  );
}

Page dashboardBuilder(BuildContext context, GoRouterState state) {
  final index = int.tryParse(state.extra.getValue('index', '0'));
  return MaterialPage<void>(
    key: state.pageKey,
    child: DashboardPage(index: index ?? 0),
  );
}

// Page changePasswordBuilder(BuildContext context, GoRouterState state) {
//   return MaterialPage<void>(
//     key: state.pageKey,
//     child: const ChangePasswordPage(),
//   );
// }

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

Page myTaskBuilder(BuildContext context, GoRouterState state) {
  return MaterialPage<void>(key: state.pageKey, child: const MyTaskPage());
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

Page waterSupplyViewDetailBuilder(BuildContext context, GoRouterState state) {
  final id = int.tryParse(state.extra.getValue('id', '0'));
  final title = state.extra.getValue('title', '');
  return MaterialPage<void>(
    key: state.pageKey,
    child: ListDataDetailsPage(
      waterSupplyId: id ?? 0,
      title: title,
    ),
  );
}

Page waterSupplyEditBuilder(BuildContext context, GoRouterState state) {
  final id = int.tryParse(state.extra.getValue('id', '0'));
  final title = state.extra.getValue('title', '');
  return MaterialPage<void>(
    key: state.pageKey,
    child: WaterSupplyEditPage(
      waterSupplyId: id ?? 0,
      title: title,
    ),
  );
}
