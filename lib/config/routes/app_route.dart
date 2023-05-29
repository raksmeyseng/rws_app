import 'package:go_router/go_router.dart';
import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/config/routes/route_handler.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/dashboard/enum/main_menu_enum.dart';

class AppRoute {
  // Core
  static const String splash = 'splash';
  static const String login = 'login';
  static const String changePassword = 'change-password';

  static const String notFound = 'not-found';
  static const String register = 'register';
  static const String editProfile = 'edit-profile';
  static const String waterSupplyDetail = 'water-supply-detail';
  static const String waterSupplyViewDetail = 'water-supply-view-detail';
  static const String waterSupplyEdit = 'water-supply-edit';
  static const String myTask='my-task';

  /// Main Menu Item
  static final String home = MainMenuEnum.home.name;
  static final String users = MainMenuEnum.users.name;
  static final String settings = MainMenuEnum.settings.name;
  static final String about = MainMenuEnum.about.name;
  static final String report = MainMenuEnum.report.name;

  static final List<RouteBase> configs = [
    GoRoute(
      name: splash,
      path: '/',
      pageBuilder: splashscreenBuilder,
      redirect: (context, state) {
        if (Application.appBloc.state.status == BaseStatusEnum.success) {
          return '/home';
        }
        return null;
      },
    ),
    GoRoute(
      name: login,
      path: '/login',
      pageBuilder: loginBuilder,
    ),
    GoRoute(
      name: register,
      path: '/register',
      pageBuilder: registerBuilder,
    ),
    // GoRoute(
    //   name: myTask,
    //   path: '/my-task',
    //   pageBuilder: myTaskBuilder,
    // ),
    GoRoute(
      name: home,
      path: '/home',
      pageBuilder: dashboardBuilder,
      routes: [
        GoRoute(
          name: users,
          path: 'users',
          pageBuilder: usersBuilder,
        ),
        GoRoute(
          name: settings,
          path: 'settings',
          pageBuilder: settingBuilder,
        ),
        GoRoute(
          name: about,
          path: 'about',
          pageBuilder: aboutBuilder,
        ),
        GoRoute(
          name:report,
          path: 'report',
          pageBuilder: reportBuilder,
        ),
        GoRoute(
          name: waterSupplyDetail,
          path: 'water-supply-detail',
          pageBuilder: waterSupplyDetailBuilder,
        ),
        GoRoute(
          name: waterSupplyViewDetail,
          path: 'water-supply-view-detail',
          pageBuilder: waterSupplyViewDetailBuilder,
        ),
        GoRoute(
          name: waterSupplyEdit,
          path: 'water-supply-edit',
          pageBuilder: waterSupplyEditBuilder,
        )
      ],
    ),
  ];
}
