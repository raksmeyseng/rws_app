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
import 'package:rws_app/core/modules/user_information/model/change_password.dart';
part 'change_password_event.dart';
part 'change_password_state.dart';

class ResetPasswordBloc
    extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc(this.userRepo)
      : super(const ResetPasswordState.initial()) {
    on<ResetPasswordEvent>(_onChangePasswordEvent, transformer: sequential());
  }

  final UserRepository userRepo;
  final currentPinFocus = FocusNode();
  final newPinFocus = FocusNode();
  final confirmNewPinFocus = FocusNode();

  Future<void> _onChangePasswordEvent(
      ResetPasswordEvent event,
      Emitter<ResetPasswordState> emit,
      ) async {
    if (event is CurrentPasswordChanged) {
      return _onCurrentPasswordChanged(event, emit);
    }
    if (event is NewPasswordChanged) {
      return _onNewPasswordChanged(event, emit);
    }
    if (event is ConfirmPasswordChanged) {
      return _onConfirmNewPasswordChanged(event, emit);
    }
    if (event is ResetPasswordSubmitted) {
      return _onSubmitted(event, emit);
    }
    if (event is ToggleCurrentPassVisibility) {
      return _toggleCurrentPassVisibility(event, emit);
    }
    if (event is ToggleNewPassVisibility) {
      return _toggleNewPassVisibility(event, emit);
    }
    if (event is ToggleConfirmNewPassVisibility) {
      return _toggleConfirmPassVisibility(event, emit);
    }
  }

  void _onCurrentPasswordChanged(
      CurrentPasswordChanged event,
      Emitter<ResetPasswordState> emit,
      ) {
    final currentPassword = CurrentPassword.pure(event.currentPass);
    emit(state.copyWith(currentPassword: currentPassword));
  }

  void _onNewPasswordChanged(
      NewPasswordChanged event,
      Emitter<ResetPasswordState> emit,
      ) {
    final newPassword = NewPassword.pure(event.newPass);
    emit(state.copyWith(newPassword: newPassword));
  }

  void _onConfirmNewPasswordChanged(
      ConfirmPasswordChanged event,
      Emitter<ResetPasswordState> emit,
      ) {
    final confirmPass = ConfirmPassword.pure(value: event.confirmPass);
    emit(state.copyWith(confirmPassword: confirmPass));
  }

  void _toggleCurrentPassVisibility(
      ToggleCurrentPassVisibility event,
      Emitter<ResetPasswordState> emit,
      ) {
    final visible = !state.currentPasswordVisibility;
    emit(state.copyWith(currentPasswordVisibility: visible));
  }

  void _toggleNewPassVisibility(
      ToggleNewPassVisibility event,
      Emitter<ResetPasswordState> emit,
      ) {
    final visible = !state.newPasswordVisibility;
    emit(state.copyWith(newPasswordVisibility: visible));
  }

  void _toggleConfirmPassVisibility(
      ToggleConfirmNewPassVisibility event,
      Emitter<ResetPasswordState> emit,
      ) {
    final visible = !state.confirmPassVisibility;
    emit(state.copyWith(confirmPassVisibility: visible));
  }

  void _onSubmitted(
    ResetPasswordSubmitted event,
    Emitter<ResetPasswordState> emit,
    ) async {
      final currentPassword = CurrentPassword.dirty(state.currentPassword.value);
      final newPassword = NewPassword.dirty(state.newPassword.value);
      final confirmPassword = ConfirmPassword.dirty(
        password: newPassword.value,
        value: state.confirmPassword.value,
      );
      emit(state.copyWith(
        currentPassword: currentPassword,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
        status: Formz.validate([newPassword, confirmPassword]),
      ));
    if (state.status.isValidated) {
      final password = Application.authBloc.state.resetPassword!;
      final userID = Application.authBloc.state.user!;
      final payload = ChangePasswordModel(
        currentPassword: password.currentPassword,
        newPassword: password.newPassword,
        confirmNewPassword: confirmPassword.value,
      );
      final res = await Application.authRepo.changePassword(userID.id, payload);
      emit(state.copyWith(
        status: FormzStatus.submissionSuccess,
        user: res.user,
      ));
      // print('user id : ${userID.id}');
      // print('user old : ${password.currentPassword}');
      // print('user new : ${password.newPassword}');
      // print('user confirm : ${password.confirmNewPassword}');
      // emit(state.copyWith(status: FormzStatus.submissionInProgress));
      // try {
      //   final password = Application.authBloc.state.resetPassword!;
      //   final userID = Application.authBloc.state.user!;
      //   final payload = ChangePasswordModel(
      //     currentPassword: password.currentPassword,
      //     newPassword: password.newPassword,
      //     confirmNewPassword: confirmPassword.value,
      //   );
      //   final res = await Application.authRepo.changePassword(userID.id, payload);
      //   emit(state.copyWith(
      //     status: FormzStatus.submissionSuccess,
      //     user: res,
      //   ));
      // } catch (_) {
      //   emit(state.copyWith(status: FormzStatus.submissionFailure));
      // }
    }
  }
}
