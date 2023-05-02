import 'package:rws_app/core/enum/language_enum.dart';

class AppConstant {
  static const String appName = 'RWS App';
  static const String clientId = 'rwsapp';
  static const String secretKey = 'ZWFjYXBwXzIwMjI6ZWFjYXBwQHNlY3JldA==';

  // The year that the app is first published
  static const int copyRightYear = 2023;

  // Format Media ID
  static const String guid = '00000000-0000-0000-0000-000000000000';

  static const String defaultFont = 'Battambang';
  static const List<String> primaryFonts = ['Battambang'];
  static const String engFontFamily = 'OpenSans';

  // Local storage keys
  /// CAUTION: Change this key value, the app will wipe out all local storage at first run
  static const String wipeKey = 'sy5a8iWP';
  static const String dataWipeKey = 'wipe-key';

  static const String theme = 'theme';
  static const String langage = 'language';
  static const String credentials = 'credentials';
  static const String envSources = 'env-sources';
  static const String selectedEnvSrcCode = 'selected-env-src-code';
  static const String activeUserToken = 'active-user-token';
  static const String userTokens = 'user-tokens';
  static const String themeOptionKey = 'theme-options-key';
  static const String primaryColorKey = 'primary-color-key';
  static const String developerOptionEnabled = 'developer-option-enabled';
  static const String selectedLicensee = 'selected-licensee';
  static const String userSetting = 'user-setting';

  // Default value
  static const LanguageEnum defaultLang = LanguageEnum.khmer;

  // OTP
  static const int otpTimeoutSeconds = 120;

  // App Environment
  static const String defaultEnvCode = 'y2c6khR0';
  static const String developerCode = '2022';

  // Date format
  static const String normalDateFormat = 'dd MMM yyyy';
  static const String monthDateFormat = 'MMM yyyy';
  static const String dateTimeFormat = 'dd MMM yyyy hh:mm a';
  static const String timeFormat = 'hh:mm a';
  static const String dobFormat = 'dd MMM yyyy';
  static const String registeredFormat = 'dd MMM yyyy hh:mm a';
  static const String publishedDateFormat = 'dd MMM yyyy hh:mm a';

  // Number format
  static const String decimalFormat = '#,##0.00;-#,##0.00;0.00';
  static const String noneDecimalFormat = '#,##0;-#,##0;0';

  static const double pieChartStartOffset = 0;
  static const String inlineSeparator = '•';
  static const bool isCurvedLineChart = false;
  static const int wrongPinAttemptLimit = 5;
  static const String mainURL = "http://18.222.12.231/en/api/";
}
