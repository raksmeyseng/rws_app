import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(const SettingState.initial()) {
    on<SettingEvent>(_onSettingEvent, transformer: sequential());
  }

  Future<void> _onSettingEvent(
    SettingEvent event,
    Emitter<SettingState> emit,
  ) async {
    if (event is SettingStarted) {
      return _onSettingStarted(event, emit);
    }
    if (event is LogoutRequested) {
      return _onLogoutRequested(event, emit);
    }
  }

  Future<void> _onSettingStarted(
    SettingStarted event,
    Emitter<SettingState> emit,
  ) async {}

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<SettingState> emit,
  ) async {
    emit(state.copyWith(logoutStatus: BaseStatusEnum.inprogress));
    try {
      await Application.authRepo.logOut(signOutAllDevice: false);
      emit(state.copyWith(logoutStatus: BaseStatusEnum.success));
    } catch (e) {
      emit(state.copyWith(logoutStatus: BaseStatusEnum.failure));
    }
  }
}
