// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_payload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPayloadModel _$UserPayloadModelFromJson(Map<String, dynamic> json) =>
    UserPayloadModel(
      fullName: json['name'] as String,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      password: json['password'] as String?,
      profileId: json['profileId'] as String?,
      profileUrl: json['profileUrl'] as String?,
    );

Map<String, dynamic> _$UserPayloadModelToJson(UserPayloadModel instance) =>
    <String, dynamic>{
      'name': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'password': instance.password,
      'profileId': instance.profileId,
      'profileUrl': instance.profileUrl,
    };
