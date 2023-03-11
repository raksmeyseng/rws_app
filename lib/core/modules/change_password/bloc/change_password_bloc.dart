import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/core/modules/authentication/models/user_model.dart';
import 'package:rws_app/core/modules/authentication/repositories/user_repository.dart';
import 'package:rws_app/core/modules/change_password/models/confirm_password.dart';
import 'package:rws_app/core/modules/change_password/models/password.dart';
import 'package:rws_app/core/modules/edit_profile/models/user_payload_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc(this.userRepo)
      : super(const ChangePasswordState.initial()) {
    on<ChangePasswordEvent>(_onChangePasswordEvent, transformer: sequential());
  }

  final UserRepository userRepo;
  final newPinFocus = FocusNode();
  final confirmNewPinFocus = FocusNode();

  Future<void> _onChangePasswordEvent(
    ChangePasswordEvent event,
    Emitter<ChangePasswordState> emit,
  ) async {
    if (event is PasswordChanged) {
      return _onPasswordChanged(event, emit);
    }
    if (event is ConfirmPasswordChanged) {
      return _onConfirmPasswordChanged(event, emit);
    }
    if (event is ChangePasswordSubmitted) {
      return _onSubmitted(event, emit);
    }
    if (event is TogglePassVisibility) {
      return _togglePassVisibility(event, emit);
    }
    if (event is ToggleConfirmPassVisibility) {
      return _toggleConfirmPassVisibility(event, emit);
    }
  }

  void _onPasswordChanged(
    PasswordChanged event,
    Emitter<ChangePasswordState> emit,
  ) {
    final password = Password.pure(event.password);
    emit(state.copyWith(password: password));
  }

  void _onConfirmPasswordChanged(
    ConfirmPasswordChanged event,
    Emitter<ChangePasswordState> emit,
  ) {
    final confirmPass = ConfirmPassword.pure(value: event.confirmPass);
    emit(state.copyWith(confirmPassword: confirmPass));
  }

  void _togglePassVisibility(
    TogglePassVisibility event,
    Emitter<ChangePasswordState> emit,
  ) {
    final visible = !state.passwordVisibility;
    emit(state.copyWith(passwordVisibility: visible));
  }

  void _toggleConfirmPassVisibility(
    ToggleConfirmPassVisibility event,
    Emitter<ChangePasswordState> emit,
  ) {
    final visible = !state.confirmPassVisibility;
    emit(state.copyWith(confirmPassVisibility: visible));
  }

  void _onSubmitted(
    ChangePasswordSubmitted event,
    Emitter<ChangePasswordState> emit,
  ) async {
    final password = Password.dirty(state.password.value);
    final confirmPassword = ConfirmPassword.dirty(
      password: password.value,
      value: state.confirmPassword.value,
    );
    emit(state.copyWith(
      password: password,
      confirmPassword: confirmPassword,
      status: Formz.validate([password, confirmPassword]),
    ));
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        final user = Application.authBloc.state.user!;
        final payload = UserPayloadModel(
          fullName: user.fullName,
          email: user.email,
          phoneNumber: user.phoneNumber,
          password: password.value,
          profileId: user.profileId,
          profileUrl: user.profileUrl,
        );
        final res = await Application.authRepo.updateProfile(user.id, payload);
        emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          user: res,
        ));
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
