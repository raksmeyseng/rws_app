import 'package:rws_app/config/routes/app_route.dart';
import 'package:rws_app/core/animation/my_animated_switcher.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/app/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'app_started_failed_view.dart';
import 'splashscreen_view.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key, this.nextRoute}) : super(key: key);

  final String? nextRoute;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == BaseStatusEnum.success) {
          if (nextRoute != null) {
            context.go(nextRoute!);
          } else {
            context.goNamed(AppRoute.dashboard);
          }
        }
      },
      child: BlocBuilder<AppBloc, AppState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          final isFailure = state.status == BaseStatusEnum.failure;
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              toolbarHeight: 0,
              backgroundColor: Theme.of(context).cardColor.withOpacity(0),
            ),
            body: MyAnimatedSwitcher(
              child: isFailure
                  ? const AppStartedFailedView()
                  : const SplashscreenView(),
            ),
          );
        },
      ),
    );
  }
}
