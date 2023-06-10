part of 'change_password_bloc.dart';

class ChangePasswordState extends Equatable {
  const ChangePasswordState._({
    this.status = FormzStatus.pure,
    this.password = const NewPassword.pure(),
    this.confirmPassword = const ConfirmPassword.pure(),
    this.user,
    this.passwordVisibility = false,
    this.confirmPassVisibility = false,
  });

  final FormzStatus status;
  final NewPassword password;
  final ConfirmPassword confirmPassword;
  final UserModel? user;
  final bool passwordVisibility;
  final bool confirmPassVisibility;

  const ChangePasswordState.initial() : this._();

  ChangePasswordState copyWith({
    FormzStatus? status,
    NewPassword? password,
    ConfirmPassword? confirmPassword,
    UserModel? user,
    bool? passwordVisibility,
    bool? confirmPassVisibility,
  }) {
    return ChangePasswordState._(
      status: status ?? this.status,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      user: user ?? this.user,
      passwordVisibility: passwordVisibility ?? this.passwordVisibility,
      confirmPassVisibility:
          confirmPassVisibility ?? this.confirmPassVisibility,
    );
  }

  @override
  List<Object?> get props => [
        status,
        password,
        confirmPassword,
        user,
        passwordVisibility,
        confirmPassVisibility,
      ];
}
