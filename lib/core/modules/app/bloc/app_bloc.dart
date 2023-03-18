import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/config/themes/app_theme.dart';
import 'package:rws_app/constants/app_constant.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/enum/internet_status_enum.dart';
import 'package:rws_app/core/enum/language_enum.dart';
import 'package:rws_app/core/enum/software_status_enum.dart';
import 'package:rws_app/core/models/app_setting_model.dart';
import 'package:rws_app/core/modules/app/models/app_theme_options.dart';
import 'package:rws_app/core/modules/app/repositories/app_repository.dart';
import 'package:rws_app/core/modules/authentication/bloc/auth_bloc.dart';
import 'package:rws_app/core/modules/authentication/repositories/auth_repository.dart';
import 'package:rws_app/core/modules/authentication/repositories/user_repository.dart';
import 'package:rws_app/translation/generated/l10n.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required this.appRepo, required this.userRepo})
      : super(const AppState.initial()) {
    on<AppEvent>(_onAppEvent, transformer: sequential());
  }

  final AppRepository appRepo;
  final UserRepository userRepo;

  Future<void> _onAppEvent(AppEvent event, Emitter<AppState> emit) async {
    if (event is AppStarted) return _onAppStarted(event, emit);
    if (event is ThemeChanged) return _onThemeChanged(event, emit);
    if (event is LanguageChanged) return _onLocaleChanged(event, emit);
    if (event is FontFamilyChanged) return _onFontFamilyChanged(event, emit);
    if (event is PrimaryColorChanged) {
      return _onPrimaryColorChanged(event, emit);
    }
    if (event is InternetStatusChanged) {
      return _onInternetStatusChanged(event, emit);
    }
    if (event is ShowInternetStatusChanged) {
      return _onShowInternetStatusChanged(event, emit);
    }
  }

  Future<void> _onAppStarted(AppStarted event, Emitter<AppState> emit) async {
    try {
      emit(const AppState.initial());
      // ==================
      // Load app information
      // ==================
      final packageInfo = await PackageInfo.fromPlatform();
      emit(state.copyWith(packageInfo: packageInfo));

      // ==================
      // Load Theme & Language first
      // ==================
      final theme = await appRepo.getThemeAsync();
      final lang = await appRepo.loadLangAsync();
      final themeOptions = await appRepo.getThemeOptions();
      emit(state.copyWith(
        theme: theme,
        language: lang,
        themeOptions: themeOptions,
      ));

      final authBloc = Application.authBloc;
      // ==================
      // Load user from remote server
      // ==================
      final userToken = await userRepo.getUserToken();
      authBloc.add(UserTokenUpdated(userToken));

      // Add some delay to wait for auth state finishing updated
      await Future.delayed(const Duration(milliseconds: 300));
      authBloc.add(AuthStatusChanged(
        status: AuthStatus.authenticated,
        userToken: userToken,
        user: userToken.user,
      ));
      // ==================
      // Load auth user settings from local storage
      // ==================
      // authBloc.add(AuthUserSettingLoaded(user.id.toString()));

      // Add some delay to wait for auth state finishing updated
      await Future.delayed(const Duration(milliseconds: 300));

      // ==================
      // App load success, update app state accordingly
      // ==================
      emit(state.copyWith(status: BaseStatusEnum.success));
    } catch (e) {
      // ==================
      // App load failed, update app state accordingly
      // ==================
      emit(state.copyWith(status: BaseStatusEnum.failure));
    }
  }

  Future<void> _onThemeChanged(
    ThemeChanged event,
    Emitter<AppState> emit,
  ) async {
    await appRepo.saveTheme(event.theme.getKey());
    emit(state.copyWith(theme: event.theme));
  }

  Future<void> _onLocaleChanged(
    LanguageChanged event,
    Emitter<AppState> emit,
  ) async {
    final locale = event.language.getLocale();
    await S.load(locale);
    await appRepo.saveLanguageCode(locale.languageCode);
    emit(state.copyWith(language: event.language));
    // final fontFamily = _getFontFamily(event.locale.languageCode);
    // add(FontFamilyChanged(fontFamily));
  }

  Future<void> _onFontFamilyChanged(
    FontFamilyChanged event,
    Emitter<AppState> emit,
  ) async {
    final options = state.themeOptions.copyWith(fontFamily: event.fontFamily);
    await _themeOptionsChanged(options, emit);
  }

  Future<void> _onPrimaryColorChanged(
    PrimaryColorChanged event,
    Emitter<AppState> emit,
  ) async {
    final options = state.themeOptions.copyWith(
      primaryColorHex: event.color.value.toRadixString(16),
    );
    await _themeOptionsChanged(options, emit);
  }

  Future<void> _themeOptionsChanged(
    AppThemeOptions options,
    Emitter<AppState> emit,
  ) async {
    final theme = AppThemeFactory.buildTheme(
      state.theme.getKey(),
      themeOptions: options,
    );
    emit(state.copyWith(theme: theme, themeOptions: options));
    await appRepo.saveThemeOptions(options);
  }

  void _onInternetStatusChanged(
    InternetStatusChanged event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(internetStatus: event.status));
    add(ShowInternetStatusChanged(event.status == InternetStatusEnum.offline));
  }

  Future<void> _onShowInternetStatusChanged(
    ShowInternetStatusChanged event,
    Emitter<AppState> emit,
  ) async {
    if (event.show) {
      emit(state.copyWith(showInternetStatus: true));
    } else {
      await Future.delayed(const Duration(seconds: 3));
      emit(state.copyWith(showInternetStatus: false));
    }
  }
}
