part of 'setting_bloc.dart';

class SettingState extends Equatable {
  const SettingState._({
    this.logoutStatus = BaseStatusEnum.initial,
  });

  final BaseStatusEnum logoutStatus;

  const SettingState.initial() : this._();

  SettingState copyWith({
    BaseStatusEnum? logoutStatus,
  }) {
    return SettingState._(
      logoutStatus: logoutStatus ?? this.logoutStatus,
    );
  }

  @override
  List<Object?> get props => [logoutStatus];
}
