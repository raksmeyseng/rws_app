import 'package:rws_app/config/routes/app_route.dart';
import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/core/modules/authentication/bloc/auth_bloc.dart';
import 'package:rws_app/core/modules/authentication/repositories/auth_repository.dart';
import 'package:rws_app/core/modules/authentication/repositories/user_repository.dart';
import 'package:rws_app/core/modules/login/models/email_input.dart';
import 'package:rws_app/core/modules/login/models/password_input.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required this.authRepo,
    required this.userRepo,
  }) : super(const LoginState()) {
    on<LoginEvent>(_onEvent);
  }

  final AuthRepository authRepo;
  final UserRepository userRepo;

  Future<void> _onEvent(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is LoginEmailChanged) {
      return _onUsernameChanged(event, emit);
    }
    if (event is LoginPasswordChanged) {
      return _onPasswordChanged(event, emit);
    }
    if (event is LoginSubmitted) {
      return _onSubmitted(event, emit);
    }
    if (event is PasswordVisibilityToggled) {
      return _onPasswordVisibilityToggled(event, emit);
    }
  }

  void _onUsernameChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    final emailInput = EmailInput.pure(event.email);
    emit(state.copyWith(emailInput: emailInput));
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final passwordInput = PasswordInput.pure(event.password);
    emit(state.copyWith(passwordInput: passwordInput));
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    final emailInput = EmailInput.dirty(state.emailInput.value);
    final passwordInput = PasswordInput.dirty(state.passwordInput.value);

    emit(state.copyWith(
      emailInput: emailInput,
      passwordInput: passwordInput,
      status: Formz.validate([emailInput, passwordInput]),
    ));

    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        final userToken = await authRepo.login(
          emailInput.value,
          passwordInput.value,
        );
        Application.authBloc.add(UserTokenUpdated(userToken));
        // Add some delay to wait for auth state finishing updated
        await Future.delayed(const Duration(milliseconds: 300));

        final user = await userRepo.getUser(userToken.userId);
        // await authRepo.saveOrUpdateUserTokens(phoneNumber, userToken);
        Application.authBloc.add(AuthStatusChanged(
          status: AuthStatus.authenticated,
          userToken: userToken,
          user: user,
        ));

        emit(state.copyWith(status: FormzStatus.submissionSuccess));
        // Add some delay to wait for auth state finishing updated
        await Future.delayed(const Duration(milliseconds: 300));
        Application.router.goNamed(AppRoute.home);
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }

  void _onPasswordVisibilityToggled(
    PasswordVisibilityToggled event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(passwordVisibility: !state.passwordVisibility));
  }
}
