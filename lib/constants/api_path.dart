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

  // Change Password
  static String changePassword(int userId) => '/change_password/$userId';
  // static String changePassword =
  //     '${AppConstant.mainURL}/change_password/';

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
      '${AppConstant.mainURL}watersupplylistbytype/?water_supply_type_id=$id';

  //Irith Part
  static String getWaterSupplyListv2(int id) =>
      '${AppConstant.mainURL}watersupply/?water_supply_type_id=$id&main_status=9';
  static String getWaterSupplyListByType(int id) =>
      '${AppConstant.mainURL}watersupplylist_v2?extra=water_supply_type_id,province_id,district_id,commune_id,village_id&water_supply_type_id=$id&province_id=';
  static String getWaterSupplyFilterResultList(String provinceId,
          String districtId, String communeId, String villageId) =>
      '${AppConstant.mainURL}watersupplylist_v2?extra=water_supply_type_id,province_id,district_id,commune_id,village_id&water_supply_type_id=&province_id=$provinceId&district_id=$districtId&commune_id=$communeId&village_id=$villageId';
  static String getWaterSupplyListAll =
      '${AppConstant.mainURL}watersupply/?water_supply_type_id=&main_status=9';
  static String getWaterSupplyMap = '${AppConstant.mainURL}watersupplymap/';
  static String getWaterSupplyMap_v2 =
      '${AppConstant.mainURL}watersupplymap_v2';
  static String getWaterSupplyDetail(int id) =>
      '${AppConstant.mainURL}watersupply/$id';

  static String getCountWaterSupplybyType(int id) =>
      '${AppConstant.mainURL}watersupplygetcountbytype/$id/';

  static String getAllMyDraft(int id) =>
      '${AppConstant.mainURL}watersupplybyuserandstatus/?created_by=$id&main_status=3';
  static String getRequestProvincialHeadDepartment(int id) =>
      '${AppConstant.mainURL}watersupplybyuserandstatus/?created_by=$id&main_status=12';
  static String getAllMyRequestedHistory(int id) =>
      '${AppConstant.mainURL}watersupplybyuser/?search=$id';
  static String getAllMyApprovalHistory(int id) =>
      '${AppConstant.mainURL}watersupplyworkflow/?watersupply_id=&user_id=$id';
  static String getPendingApprovalAdmin(int id) =>
      '${AppConstant.mainURL}watersupply/';
  static String getPendingApprovalProvincialHead(int id) =>
      '${AppConstant.mainURL}watersupplybyprovince/?province_id=$id&main_status=1';
  static String getPendingApprovalDataVerifier1 =
      '${AppConstant.mainURL}watersupplybyprovince/?province_id=&main_status=2';
  static String getPendingApprovalDataVerifier2 =
      '${AppConstant.mainURL}watersupplybyprovince/?province_id=&main_status=5';
  static String getPendingApprovalDepartmentHead =
      '${AppConstant.mainURL}watersupplybyprovinceandmultiplestatus/?main_status=7%2C12&province_id=';

  static String getReportExcel = '${AppConstant.mainURL}download-result/excel';
  static String getReportWord = '${AppConstant.mainURL}download-result/docs';

  static String addWaterSupply = '${AppConstant.mainURL}v2/watersupply'; //post
  static String updateWaterSupply(String id) =>
      '${AppConstant.mainURL}v2/watersupply/$id/update/';

  static String deleteWaterSupply(int id) =>
      '${AppConstant.mainURL}v2/watersupply/$id/delete/'; //put

  static String postWorkFlow =
      '${AppConstant.mainURL}v2/watersupplyworkflow'; //post

  static String updateWaterSupplyMainStatus(int id) =>
      '${AppConstant.mainURL}watersupply/$id/update/'; //put

  static String postWaterSupplyQRcode =
      '${AppConstant.mainURL}watersupplyqrcode/'; //post

  static String postWell = '${AppConstant.mainURL}watersupplywell/'; //post
  static String postWellOption =
      '${AppConstant.mainURL}watersupplywelloptionvalue/'; //post

  static String postSmallPipe = '${AppConstant.mainURL}watersupplypipe/';
  static String postSmallPipeOptionValue =
      '${AppConstant.mainURL}watersupplypipoptionvalue/';

  static String postKiosk = '${AppConstant.mainURL}watersupplykiosk/';
  static String postKioskOptionValue =
      '${AppConstant.mainURL}watersupplykioskoptionvalue/';

  static String postCommunityPond =
      '${AppConstant.mainURL}watersupplycommunitypond/';

  static String postRainWaterHarvesting =
      '${AppConstant.mainURL}watersupplyrainwaterharvesting/';

  static String postPipe = '${AppConstant.mainURL}watersupplypipeprivate/';
  static String postPipeOptionValue =
      '${AppConstant.mainURL}watersupplypipeprivateoptionvalue/';

  static String postAirWater = '${AppConstant.mainURL}watersupplyairwater/';
  static String postAirWaterOptionValue =
      '${AppConstant.mainURL}watersupplyairwateroptionvalue/';

  static String postWaterQualityParameter =
      '${AppConstant.mainURL}watersupplyqualitycheckparameter/';

  static String getProvince() => '${AppConstant.mainURL}province';
  static String getProvinceByDataEntry(int id) =>
      '${AppConstant.mainURL}province/?id=$id';
  static String getDistrictByProvinceId(int id) =>
      '${AppConstant.mainURL}district/?province_id__id=$id';
  static String getCommuneByDistrictId(int id) =>
      '${AppConstant.mainURL}commune/?district_id__id=$id';
  static String getVillageByCommuneId(int id) =>
      '${AppConstant.mainURL}village/?commune_id__id=$id';

  static String generateQRCode(int id) =>
      '${AppConstant.mainURL}generateqrcode/$id/';
}
