// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_setting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSettingModel _$UserSettingModelFromJson(Map<String, dynamic> json) =>
    UserSettingModel(
      pin: json['pin'] as String?,
      biometricEnabled: json['biometricEnable'] as bool?,
      profileMediaId: json['profileMediaId'] as String?,
      profileMediaUrl: json['profileUrl'] as String?,
      languageCode: json['language'] as String?,
      nextAllowLogin: json['nextAllowLogin'] == null
          ? null
          : DateTime.parse(json['nextAllowLogin'] as String),
    );

Map<String, dynamic> _$UserSettingModelToJson(UserSettingModel instance) =>
    <String, dynamic>{
      'pin': instance.pin,
      'biometricEnable': instance.biometricEnabled,
      'profileMediaId': instance.profileMediaId,
      'profileUrl': instance.profileMediaUrl,
      'language': instance.languageCode,
      'nextAllowLogin': instance.nextAllowLogin?.toIso8601String(),
    };
