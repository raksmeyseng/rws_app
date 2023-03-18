// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTokenModel _$UserTokenModelFromJson(Map<String, dynamic> json) =>
    UserTokenModel(
      data: DataModel.fromJson(json['data'] as Map<String, dynamic>),
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserTokenModelToJson(UserTokenModel instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
      'user': instance.user.toJson(),
    };

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      expiry: DateTime.parse(json['expiry'] as String),
      token: json['token'] as String,
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'expiry': instance.expiry.toIso8601String(),
      'token': instance.token,
    };
