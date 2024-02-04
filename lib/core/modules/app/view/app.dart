import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rws_app/config/routes/app_route.dart';
import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/constants/app_constant.dart';
import 'package:rws_app/core/enum/language_enum.dart';
import 'package:rws_app/core/enum/software_status_enum.dart';
import 'package:rws_app/core/modules/app/bloc/app_bloc.dart';
import 'package:rws_app/core/modules/authentication/bloc/auth_bloc.dart';
import 'package:rws_app/core/modules/authentication/repositories/auth_repository.dart';
import 'package:rws_app/core/widgets/update_dialog.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:rws_app/utils/common_utils.dart';
import 'package:rws_app/utils/helpers/dialog_helper.dart';
//import 'package:apple_sign_in/apple_sign_in.dart';

class RwsApp extends StatefulWidget {
  const RwsApp({Key? key}) : super(key: key);

  @override
  State<RwsApp> createState() => _RwsAppState();
}

class _RwsAppState extends State<RwsApp> {
  @override
  void initState() {
    super.initState();
    listenAndHandleSystemAppearanceChanged();
    // NetworkHelper.subscribe();
    if(Platform.isIOS){                                                      //check for ios if developing for both android & ios
      // AppleSignIn.onCredentialRevoked.listen((_) {
         print('Credentials revoked');
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => Application.authBloc),
        BlocProvider(
          create: (_) => Application.appBloc..add(const AppStarted()),
        ),
      ],
      child: const RwsAppView(),
    );
  }

  @override
  void dispose() {
    // NetworkHelper.unsubscribe();
    super.dispose();
  }
}

class RwsAppView extends StatelessWidget {
  const RwsAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (state.status != AuthStatus.authenticated) {
              Application.router.goNamed(AppRoute.login);
            }
          },
        ),
        BlocListener<AppBloc, AppState>(
          listenWhen: (previous, current) =>
              previous.softwareStatus != current.softwareStatus,
          listener: (context, state) {
            switch (state.softwareStatus) {
              case SoftwareStatusEnum.requiredUpdate:
                _showUpdateDialog(force: true);
                break;
              case SoftwareStatusEnum.outdated:
                _showUpdateDialog(force: false);
                break;
              default:
            }
          },
        ),
      ],
      child: BlocBuilder<AppBloc, AppState>(
        buildWhen: (previous, current) {
          return previous.language != current.language ||
              previous.theme.themeData != current.theme.themeData;
        },
        builder: (context, state) {
          return MaterialApp.router(
            title: AppConstant.appName,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            theme: state.theme.themeData,
            supportedLocales: S.delegate.supportedLocales,
            locale: state.language.getLocale(),
            routerConfig: Application.router,
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1)),
                child: child!,
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _showUpdateDialog({required bool force}) async {
    if (force) {
      DialogHelper.showAnimatedDialog(
        barrierDismissible: false,
        pageBuilder: (context, a1, a2) {
          return UpdateDialog(
            message: S.of(context).msg_version_force_update,
            forceUpdate: true,
          );
        },
      );
    } else {
      DialogHelper.showAnimatedDialog(
        barrierDismissible: false,
        pageBuilder: (context, a1, a2) {
          return UpdateDialog(
            message: S.of(context).msg_version_update,
            forceUpdate: false,
          );
        },
      );
    }
  }
}
