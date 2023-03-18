part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = FormzStatus.pure,
    this.userNameInput = const UserNameInput.pure(),
    this.passwordInput = const PasswordInput.pure(),
    this.passwordVisibility = false,
  });

  final FormzStatus status;
  final UserNameInput userNameInput;
  final PasswordInput passwordInput;
  final bool passwordVisibility;

  LoginState copyWith({
    FormzStatus? status,
    UserNameInput? userNameInput,
    PasswordInput? passwordInput,
    bool? passwordVisibility,
  }) {
    return LoginState(
      status: status ?? this.status,
      userNameInput: userNameInput ?? this.userNameInput,
      passwordInput: passwordInput ?? this.passwordInput,
      passwordVisibility: passwordVisibility ?? this.passwordVisibility,
    );
  }

  @override
  List<Object> get props => [
        status,
        userNameInput,
        passwordInput,
        passwordVisibility,
      ];
}
