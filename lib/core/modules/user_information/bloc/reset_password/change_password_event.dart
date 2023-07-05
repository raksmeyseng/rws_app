part of 'change_password_bloc.dart';

abstract class ResetPasswordEvent extends Equatable {
  const ResetPasswordEvent();

  @override
  List<Object> get props => [];
}

class CurrentPasswordChanged extends ResetPasswordEvent {
  const CurrentPasswordChanged(this.currentPass);

  final String currentPass;

  @override
  List<Object> get props => [currentPass];
}


class NewPasswordChanged extends ResetPasswordEvent {
  const NewPasswordChanged(this.newPass);

  final String newPass;

  @override
  List<Object> get props => [newPass];
}

class ConfirmPasswordChanged extends ResetPasswordEvent {
  const ConfirmPasswordChanged(this.confirmPass);

  final String confirmPass;

  @override
  List<Object> get props => [confirmPass];
}

class ToggleCurrentPassVisibility extends ResetPasswordEvent {
  const ToggleCurrentPassVisibility();
}

class ToggleNewPassVisibility extends ResetPasswordEvent {
  const ToggleNewPassVisibility();
}

class ToggleConfirmNewPassVisibility extends ResetPasswordEvent {
  const ToggleConfirmNewPassVisibility();
}

class ResetPasswordSubmitted extends ResetPasswordEvent {
  const ResetPasswordSubmitted();
}
