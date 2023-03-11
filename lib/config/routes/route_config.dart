import 'package:go_router/go_router.dart';
import 'package:rws_app/config/routes/app_route.dart';
import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/config/routes/route_handler.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/authentication/repositories/auth_repository.dart';

class RouteConfig {
  static GoRouter configureRouter() {
    return GoRouter(
      routes: AppRoute.configs,
      initialLocation: '/home',
      errorPageBuilder: notFoundBuilder,
      redirect: (context, state) {
        if (state.subloc.isEmpty) {
          return null;
        }

        final authState = Application.authBloc.state;
        final appState = Application.appBloc.state;
        final loggedIn = authState.status == AuthStatus.authenticated;
        final appLoaded = appState.status == BaseStatusEnum.success;

        // If app is not loaded yet, go to splash screen first
        if (!appLoaded && state.subloc != '/') {
          return '/?from=${state.subloc}';
        }
        if (state.subloc == '/' && !appLoaded) {
          return null;
        }

        // Check if user not logged in yet, send them to login
        final loggingIn = state.subloc == '/login';
        if (!loggedIn) {
          return loggingIn ? null : '/login';
        }

        // If the user is logged in but still on the login page, send them to the home page
        if (loggingIn) {
          return '/home';
        }

        // Go straight to the page
        return null;
      },

      // changes on the listenable will cause the router to refresh it's route
      // refreshListenable: GoRouterRefreshStream(Application.authBloc.stream),

      // log diagnostic info for your routes
      debugLogDiagnostics: true,
    );
  }
}
