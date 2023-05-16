import 'dart:async';

import 'package:rws_app/constants/api_path.dart';
import 'package:rws_app/core/modules/authentication/models/user_model.dart';
import 'package:rws_app/core/modules/authentication/models/user_setting_model.dart';
import 'package:rws_app/core/modules/authentication/models/user_token_model.dart';
import 'package:rws_app/core/services/rest_api_service.dart';

class UserRepository extends RestApiService {

  Future<UserTokenModel> getUserToken() async {
    final user = await get(ApiPath.getUserToken);
    return UserTokenModel.fromJson(user);
  }

  Future<UserModel> getUser(int userId) async {
    final user = await get(ApiPath.getUser(userId));
    return UserModel.fromJson(user);
  }

  Future<UserModel> updateSettings(int userId, UserSettingModel setting) async {
    final user = await put(ApiPath.updateUserSetting(userId), data: setting);
    return UserModel.fromJson(user);
  }

  Future<UserTokenModel> userLogin(String username,String password) async{
    print(ApiPath.login);

    final login= await post(ApiPath.login,data:
      {'username':username,'password':password});
    print(login);

    return UserTokenModel.fromJson(login);
  }

}
