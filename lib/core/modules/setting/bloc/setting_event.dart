part of 'setting_bloc.dart';

abstract class SettingEvent extends Equatable {
  const SettingEvent();

  @override
  List<Object> get props => [];
}

class SettingStarted extends SettingEvent {
  const SettingStarted();
}

class LocalAuthToggled extends SettingEvent {
  const LocalAuthToggled();
}

class LogoutRequested extends SettingEvent {
  const LogoutRequested();
}
