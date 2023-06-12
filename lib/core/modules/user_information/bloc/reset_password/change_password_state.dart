part of 'change_password_bloc.dart';

class ResetPasswordState extends Equatable {
  const ResetPasswordState._({
    this.status = FormzStatus.pure,
    this.currentPassword = const CurrentPassword.pure(),
    this.newPassword = const NewPassword.pure(),
    this.confirmPassword = const ConfirmPassword.pure(),
    this.user,
    this.currentPasswordVisibility = false,
    this.newPasswordVisibility = false,
    this.confirmPassVisibility = false,
  });

  final FormzStatus status;
  final CurrentPassword currentPassword;
  final NewPassword newPassword;
  final ConfirmPassword confirmPassword;
  final UserModel? user;
  final bool currentPasswordVisibility;
  final bool newPasswordVisibility;
  final bool confirmPassVisibility;

  const ResetPasswordState.initial() : this._();

  ResetPasswordState copyWith({
    FormzStatus? status,
    CurrentPassword? currentPassword,
    NewPassword? newPassword,
    ConfirmPassword? confirmPassword,
    UserModel? user,
    bool? currentPasswordVisibility,
    bool? newPasswordVisibility,
    bool? confirmPassVisibility,
  }) {
    return ResetPasswordState._(
      status: status ?? this.status,
      currentPassword: currentPassword ?? this.currentPassword,
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      user: user ?? this.user,
      currentPasswordVisibility: currentPasswordVisibility ?? this.currentPasswordVisibility,
      newPasswordVisibility: newPasswordVisibility ?? this.newPasswordVisibility,
      confirmPassVisibility: confirmPassVisibility ?? this.confirmPassVisibility,
    );
  }

  @override
  List<Object?> get props => [
    status,
    currentPassword,
    newPassword,
    confirmPassword,
    user,
    currentPasswordVisibility,
    newPasswordVisibility,
    confirmPassVisibility,
  ];
}
