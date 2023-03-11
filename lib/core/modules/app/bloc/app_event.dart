part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
  @override
  List<Object?> get props => [];
}

class AppStarted extends AppEvent {
  const AppStarted();
}

class ThemeChanged extends AppEvent {
  const ThemeChanged({required this.theme});
  final AppTheme theme;
  @override
  List<Object> get props => [theme];
}

class LanguageChanged extends AppEvent {
  const LanguageChanged(this.language);
  final LanguageEnum language;
  @override
  List<Object> get props => [language];
}

class FontFamilyChanged extends AppEvent {
  const FontFamilyChanged(this.fontFamily);

  final String fontFamily;

  @override
  List<Object?> get props => [fontFamily];
}

class PrimaryColorChanged extends AppEvent {
  const PrimaryColorChanged(this.color);

  final Color color;
  @override
  List<Object?> get props => [color];
}

class InternetStatusChanged extends AppEvent {
  const InternetStatusChanged(this.status);
  final InternetStatusEnum status;
  @override
  List<Object?> get props => [status];
}

class ShowInternetStatusChanged extends AppEvent {
  const ShowInternetStatusChanged(this.show);
  final bool show;
  @override
  List<Object?> get props => [show];
}
