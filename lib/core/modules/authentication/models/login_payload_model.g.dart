// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_payload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginPayloadModel _$LoginPayloadModelFromJson(Map<String, dynamic> json) =>
    LoginPayloadModel(
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginPayloadModelToJson(LoginPayloadModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
