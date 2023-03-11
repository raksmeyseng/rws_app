part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = FormzStatus.pure,
    this.emailInput = const EmailInput.pure(),
    this.passwordInput = const PasswordInput.pure(),
    this.passwordVisibility = false,
  });

  final FormzStatus status;
  final EmailInput emailInput;
  final PasswordInput passwordInput;
  final bool passwordVisibility;

  LoginState copyWith({
    FormzStatus? status,
    EmailInput? emailInput,
    PasswordInput? passwordInput,
    bool? passwordVisibility,
  }) {
    return LoginState(
      status: status ?? this.status,
      emailInput: emailInput ?? this.emailInput,
      passwordInput: passwordInput ?? this.passwordInput,
      passwordVisibility: passwordVisibility ?? this.passwordVisibility,
    );
  }

  @override
  List<Object> get props => [
        status,
        emailInput,
        passwordInput,
        passwordVisibility,
      ];
}
