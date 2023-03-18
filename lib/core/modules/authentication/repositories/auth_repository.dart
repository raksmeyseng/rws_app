import 'dart:async';
import 'dart:convert';

import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/constants/api_path.dart';
import 'package:rws_app/constants/app_constant.dart';
import 'package:rws_app/core/modules/authentication/bloc/auth_bloc.dart';
import 'package:rws_app/core/modules/authentication/models/local_user_setting_model.dart';
import 'package:rws_app/core/modules/authentication/models/login_payload_model.dart';
import 'package:rws_app/core/modules/authentication/models/register_payload_model.dart';
import 'package:rws_app/core/modules/authentication/models/register_response_model.dart';
import 'package:rws_app/core/modules/authentication/models/user_model.dart';
import 'package:rws_app/core/modules/authentication/models/user_token_model.dart';
import 'package:rws_app/core/modules/edit_profile/models/user_payload_model.dart';
import 'package:rws_app/core/services/local_storage_service.dart';
import 'package:rws_app/core/services/rest_api_service.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthRepository extends RestApiService {
  Future<bool> logOut({bool signOutAllDevice = false}) async {
    final isLogout = await post(
      ApiPath.logout,
      data: {'signOutAllDevice': signOutAllDevice},
    );
    if (isLogout == true) {
      // await FirebaseMessageHelper.unsubscribeAuthenticatedTopics();
      await removeActiveUserToken();
      Application.authBloc.add(const UserLogoutRequested());
      return true;
    }
    return false;
  }

  Future<void> saveActiveUserToken(UserTokenModel userToken) async {
    const key = AppConstant.activeUserToken;
    final value = json.encode(userToken);
    await LocalStorageService.instance.saveString(key, value);
  }

  Future<UserTokenModel?> getActiveUserToken() async {
    final token = await LocalStorageService.instance
        .getString(AppConstant.activeUserToken);
    if (token == null) return null;
    final user = json.decode(token);
    return UserTokenModel.fromJson(user);
  }

  Future<void> removeActiveUserToken() async {
    await LocalStorageService.instance.remove(AppConstant.activeUserToken);
  }

  Future<void> removeSavedToken(String phoneNumber) async {
    const key = AppConstant.userTokens;
    final phone = phoneNumber.replaceAll(' ', '');
    final userTokens = await getUserTokens() ?? {};
    userTokens.remove(phone);
    await LocalStorageService.instance.saveString(key, json.encode(userTokens));
  }

  Future<void> removeSavedTokenByUserId(int userId) async {
    const key = AppConstant.userTokens;
    final userTokens = await getUserTokens() ?? {};
    userTokens.removeWhere((key, value) =>
        UserTokenModel.fromJson(jsonDecode(value)).user.id == userId);
    await LocalStorageService.instance.saveString(key, json.encode(userTokens));
  }

  Future<Map<String, String>?> getUserTokens() async {
    const key = AppConstant.userTokens;
    final userTokens = await LocalStorageService.instance.getString(key);
    if (userTokens == null) return null;
    return Map.castFrom(json.decode(userTokens));
  }

  Future<void> removeAllUserToken() async {
    const key = AppConstant.userTokens;
    await LocalStorageService.instance.remove(key);
  }

  Future<RegisterResponseModel> register(RegisterPayloadModel payload) async {
    final res = await post(ApiPath.register, data: payload);
    return RegisterResponseModel.fromJson(res);
  }

  Future<UserModel> updateProfile(int id, UserPayloadModel payload) async {
    final res = await put(ApiPath.updateProfile(id), data: payload);
    return UserModel.fromJson(res);
  }

  Future<Map<String, LocalUserSettingModel>?> getUserSetting() async {
    const key = AppConstant.userSetting;
    final userSetting = await LocalStorageService.instance.getString(key);
    if (userSetting == null) return null;
    final data = json.decode(userSetting) as Map<String, dynamic>;
    final Map<String, LocalUserSettingModel> res = {};
    for (var i = 0; i < data.keys.length; i++) {
      final key = data.keys.elementAt(i);
      res[key] = LocalUserSettingModel.fromJson(data[key]);
    }
    return res;
  }

  Future<void> saveBiometricEnabled(String userId, bool enabled) async {
    const key = AppConstant.userSetting;
    final setting = await getUserSetting() ?? {};
    final userSetting = setting[userId] ?? const LocalUserSettingModel();
    setting[userId] = userSetting.copyWith(biometricEnabled: enabled);
    await LocalStorageService.instance.saveString(key, json.encode(setting));
  }

  Future<void> removeAllUserSetting() async {
    const key = AppConstant.userSetting;
    await LocalStorageService.instance.remove(key);
  }

  Future<void> removeUserSetting(String userId) async {
    const key = AppConstant.userSetting;
    final setting = await getUserSetting() ?? {};
    setting.remove(userId);
    await LocalStorageService.instance.saveString(key, json.encode(setting));
  }

  Future<LocalUserSettingModel> getSettingByUserId(String userId) async {
    final setting = await getUserSetting() ?? {};
    return setting[userId] ?? const LocalUserSettingModel();
  }

  /// Only call this function on account deactivation or user token invoked
  Future<void> clearCurrentUserCache(int userId) async {
    await Future.wait([
      removeActiveUserToken(),
      removeSavedTokenByUserId(userId),
      removeUserSetting(userId.toString()),
    ]);
    // await FirebaseMessageHelper.unsubscribeAuthenticatedTopics();
    Application.authBloc.add(const UserLogoutRequested());
  }

  Future<UserTokenModel> login(String email, String password) async {
    final payload = LoginPayloadModel(
      username: email,
      password: password,
    );
    final res = await post(ApiPath.login, data: payload);
    return UserTokenModel.fromJson(res);
  }
}
