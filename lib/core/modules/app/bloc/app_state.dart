part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState._({
    this.theme = const AutoTheme(AppThemeOptions()),
    this.language = AppConstant.defaultLang,
    this.status = BaseStatusEnum.initial,
    this.themeOptions = const AppThemeOptions(
      primaryColorHex: AppColor.primaryHex,
      fontFamily: AppConstant.defaultFont,
    ),
    this.isLoading = false,
    this.packageInfo,
    this.softwareStatus = SoftwareStatusEnum.unknown,
    this.appSetting,
    this.internetStatus = InternetStatusEnum.online,
    this.showInternetStatus = false,
  });

  final AppTheme theme;
  final LanguageEnum language;
  final BaseStatusEnum status;
  final AppThemeOptions themeOptions;
  final bool isLoading;
  final PackageInfo? packageInfo;
  final SoftwareStatusEnum softwareStatus;
  final AppSettingModel? appSetting;
  final InternetStatusEnum internetStatus;
  final bool showInternetStatus;

  const AppState.initial() : this._();
  const AppState.appearanceLoaded() : this._();

  AppState copyWith({
    AppTheme? theme,
    LanguageEnum? language,
    BaseStatusEnum? status,
    AppThemeOptions? themeOptions,
    bool? devOptionEnabled,
    bool? isLoading,
    PackageInfo? packageInfo,
    SoftwareStatusEnum? softwareStatus,
    AppSettingModel? appSetting,
    InternetStatusEnum? internetStatus,
    bool? showInternetStatus,
  }) {
    return AppState._(
      theme: theme ?? this.theme,
      language: language ?? this.language,
      status: status ?? this.status,
      themeOptions: themeOptions ?? this.themeOptions,
      isLoading: isLoading ?? this.isLoading,
      packageInfo: packageInfo ?? this.packageInfo,
      softwareStatus: softwareStatus ?? this.softwareStatus,
      appSetting: appSetting ?? this.appSetting,
      internetStatus: internetStatus ?? this.internetStatus,
      showInternetStatus: showInternetStatus ?? this.showInternetStatus,
    );
  }

  // we use this to help state identify whether the themeData has changed
  ThemeData get _themeData {
    return theme.themeData;
  }

  @override
  List<Object?> get props => [
        theme,
        _themeData,
        language,
        status,
        themeOptions,
        isLoading,
        packageInfo,
        softwareStatus,
        appSetting,
        internetStatus,
        showInternetStatus,
      ];
}
