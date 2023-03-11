import 'package:rws_app/config/routes/route_config.dart';
import 'package:rws_app/core/modules/app/bloc/app_bloc.dart';
import 'package:rws_app/core/modules/app/repositories/app_repository.dart';
import 'package:rws_app/core/modules/authentication/bloc/auth_bloc.dart';
import 'package:rws_app/core/modules/authentication/repositories/auth_repository.dart';
import 'package:rws_app/core/modules/authentication/repositories/user_repository.dart';
import 'package:rws_app/core/repositories/media_repository.dart';
import 'package:rws_app/utils/event/event_bus.dart';
import 'package:flutter/material.dart';

class Application {
  static final appRepo = AppRepository();
  static final authRepo = AuthRepository();
  static final userRepo = UserRepository();
  static final mediaRepo = MediaRepository();

  static final appBloc = AppBloc(appRepo: appRepo, userRepo: userRepo);
  static final authBloc = AuthBloc(authRepo: authRepo);

  static final router = RouteConfig.configureRouter();

  static BuildContext? get context {
    return router.routerDelegate.navigatorKey.currentContext;
  }

  static final eventBus = EventBus();
}
