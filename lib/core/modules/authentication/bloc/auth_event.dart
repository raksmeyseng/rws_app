part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthStatusChanged extends AuthEvent {
  const AuthStatusChanged({
    required this.status,
    this.userToken,
    this.user,
  });

  final AuthStatus status;
  final UserTokenModel? userToken;
  final UserModel? user;

  @override
  List<Object?> get props => [status, userToken, user];
}

class UserUpdated extends AuthEvent {
  const UserUpdated(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}

class UserTokenUpdated extends AuthEvent {
  const UserTokenUpdated(this.userToken);
  final UserTokenModel userToken;
  @override
  List<Object?> get props => [userToken];
}

class LocalAuthStatusChanged extends AuthEvent {
  const LocalAuthStatusChanged(this.status);
  final BiometricAuthStatusEnum status;
  @override
  List<Object?> get props => [status];
}

class AccountDeactivated extends AuthEvent {
  const AccountDeactivated();
}

class AuthUserSettingLoaded extends AuthEvent {
  const AuthUserSettingLoaded(this.userId);
  final String userId;
}

class UserLogoutRequested extends AuthEvent {
  const UserLogoutRequested();
}
