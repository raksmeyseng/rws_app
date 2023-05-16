import 'package:rws_app/constants/app_constant.dart';

class ApiPath {
  // Security Api
  static const String register = '/v1/Security/Register';
  static const String confirmRegister = '/v1/Security/ConfirmRegistration';
  static const String resendOtp = '/v1/Security/ResendOtp';
  static String updateUserSetting(int userId) => '/api/User/$userId/Setting';
  // static String getUser(int? userId) => '/api/User/$userId';
  static const String requestPhoneAuthSession =
      '/v1/Security/RequestPhoneAuthenticateSession';
  static const String authorizePhone = '/v1/Security/RequestAuthorizeByPhone';
  static const String logout = '/v1/Security/signout';
  static const String requestOtpSession = '/v1/Security/RequestOTPSession';
  static String confirmResetPin(int userId) =>
      '/v1/Security/$userId/ConfirmResetPin';
  static String deactivateAccount(int userId) =>
      '/v1/Security/$userId/Deactivate';
  static const String refreshToken = '/v1/Security/RefreshToken';
  static String updateProfile(int userId) => '/api/UserAdmin/$userId';
  static String login = '${AppConstant.mainURL}login/';

  // Media Api
  static const String uploadFile = '/api/Media/File';
  static const String getAppSetting = '/v1/App/Setting';

  // Core Api
  static const String getAllAccount =
      'https://eac-app-admin.free.mockoapp.net/api/accounts';
  static String getAccountDetails(int id) =>
      'https://eac-app-admin.free.mockoapp.net/api/accounts/$id';
  static String getUser(int? userId) => '/api/UserAdmin/$userId';
  static String getUserToken = 'https://rwsapp.free.mockoapp.net/user';


  static String getWaterSupplyType =
      //'https://rwsapp.free.mockoapp.net/api/water-supply-type';
      '${AppConstant.mainURL}watersupplytype/';

  static String getWaterSupplyList(int id) =>
      'https://rwsapp.free.mockoapp.net/api/water-supply/$id';

  //Irith Part
  static String getWaterSupplyListv2(int id) =>
    '${AppConstant.mainURL}watersupply/?water_supply_type_id=$id&main_status=9';
  static String getWaterSupplyDetail(int id) =>
      '${AppConstant.mainURL}watersupply/$id';

  static String getAllMyDraft(int id) => '${AppConstant.mainURL}watersupplybyuserandstatus/?created_by=$id&main_status=3';
  static String getAllMyRequestedHistory(int id)=>'${AppConstant.mainURL}watersupplybyuser/?search=$id';
  static String getAllMyApprovalHistory(int id)=>'${AppConstant.mainURL}watersupplyworkflow/?watersupply_id=&user_id=$id';
  static String getPendingApprovalAdmin(int id)=>'${AppConstant.mainURL}watersupply/';
  static String getPendingApprovalProvincialHead(int id) => '${AppConstant.mainURL}watersupplybyprovince/?province_id=$id&main_status=1';

  static String addWaterSupply(int id) =>
      '${AppConstant.mainURL}watersupply/$id';
  static String updateWaterSupply(int id, int waterSupplyTypeId) =>
      '${AppConstant.mainURL}watersupply/$id';
}
    