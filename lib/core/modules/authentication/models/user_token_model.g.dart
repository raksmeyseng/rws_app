// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTokenModel _$UserTokenModelFromJson(Map<String, dynamic> json) =>
    UserTokenModel(
      issuer: json['issuer'] as String?,
      userId: json['userId'] as int,
      token: json['token'] as String,
      refreshToken: json['refreshToken'] as String,
      tokenExpireTime: DateTime.parse(json['tokenExpireTime'] as String),
    );

Map<String, dynamic> _$UserTokenModelToJson(UserTokenModel instance) =>
    <String, dynamic>{
      'issuer': instance.issuer,
      'userId': instance.userId,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'tokenExpireTime': instance.tokenExpireTime.toIso8601String(),
    };
