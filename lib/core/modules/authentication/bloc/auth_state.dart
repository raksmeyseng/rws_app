part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState._({
    this.resetPassword,
    this.status = AuthStatus.unknown,
    this.userToken,
    this.user,
    this.biometricStatus = BiometricAuthStatusEnum.disabled,
    this.biometricIcon = AssetPath.iconBioFingerprint,
    this.wrongPinAttemptCount = 0,
  });

  final AuthStatus status;
  final UserTokenModel? userToken;
  final UserModel? user;
  final ChangePasswordModel? resetPassword;
  final BiometricAuthStatusEnum biometricStatus;
  final String biometricIcon;
  final int wrongPinAttemptCount;

  const AuthState.unknown() : this._();

  AuthState copyWith({
    AuthStatus? status,
    UserModel? user,
    UserTokenModel? userToken,
    BiometricAuthStatusEnum? biometricStatus,
    String? biometricIcon,
    int? wrongPinAttemptCount,
  }) {
    return AuthState._(
      resetPassword: resetPassword ?? resetPassword,
      status: status ?? this.status,
      user: user ?? this.user,
      userToken: userToken ?? this.userToken,
      biometricStatus: biometricStatus ?? this.biometricStatus,
      biometricIcon: biometricIcon ?? this.biometricIcon,
      wrongPinAttemptCount: wrongPinAttemptCount ?? this.wrongPinAttemptCount,
    );
  }

  @override
  List<Object?> get props => [
        status,
        user,
        userToken,
        biometricStatus,
        biometricIcon,
        wrongPinAttemptCount,
      ];
}
