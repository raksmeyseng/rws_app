import 'package:rws_app/config/routes/app_route.dart';
import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/constants/asset_path.dart';
import 'package:rws_app/core/enum/biometric_auth_status_enum.dart';
import 'package:rws_app/core/modules/authentication/models/user_model.dart';
import 'package:rws_app/core/modules/authentication/models/user_token_model.dart';
import 'package:rws_app/core/modules/authentication/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authRepo}) : super(const AuthState.unknown()) {
    on<AuthStatusChanged>(_onAuthStatusChanged);
    on<UserUpdated>(_onUserUpdated);
    on<UserTokenUpdated>(_onUserTokenUpdated);
    on<LocalAuthStatusChanged>(_onLocalAuthStatusChanged);
    on<UserLogoutRequested>(_onLogoutRequested);
  }

  final AuthRepository authRepo;

  void _onUserUpdated(UserUpdated event, Emitter<AuthState> emit) async {
    emit(state.copyWith(user: event.user));
    add(AuthUserSettingLoaded(event.user.id.toString()));
  }

  void _onAuthStatusChanged(
    AuthStatusChanged event,
    Emitter<AuthState> emit,
  ) async {
    switch (event.status) {
      case AuthStatus.unauthenticated:
        emit(state.copyWith(status: AuthStatus.unauthenticated));
        break;
      case AuthStatus.authenticated:
        await authRepo.saveActiveUserToken(event.userToken!);
        emit(state.copyWith(
          status: AuthStatus.authenticated,
          user: event.user,
          userToken: event.userToken,
        ));
        // add(AuthUserSettingLoaded(event.user!.id.toString()));
        break;
      default:
        return emit(state.copyWith(status: AuthStatus.unknown));
    }
  }

  void _onUserTokenUpdated(
    UserTokenUpdated event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(userToken: event.userToken));
  }

  void _onLocalAuthStatusChanged(
    LocalAuthStatusChanged event,
    Emitter<AuthState> emit,
  ) {
    authRepo.saveBiometricEnabled(
      state.user!.id.toString(),
      event.status == BiometricAuthStatusEnum.enabled,
    );
    emit(state.copyWith(biometricStatus: event.status));
  }

  Future<void> _onLogoutRequested(
    UserLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.unknown());
    await Future.delayed(const Duration(milliseconds: 300));
    Application.router.goNamed(AppRoute.login);
  }
}
