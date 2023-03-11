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
  static const String home = 'home';
  static const String settings = 'settings';
  static const String about = 'about';
  static const String notFound = 'not-found';
  static const String register = 'register';
  static const String editProfile = 'edit-profile';

  // Main Menu
  static final String account = MainMenuEnum.account.name;
  static final String supplier = MainMenuEnum.setting.name;
  static final String aboutEAC = MainMenuEnum.about.name;

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
    GoRoute(
      name: home,
      path: '/home',
      pageBuilder: dashboardBuilder,
    ),
  ];
}
