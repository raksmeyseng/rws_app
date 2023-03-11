// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int,
      fullName: json['name'] as String,
      active: json['active'] as bool?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      gender: $enumDecodeNullable(_$GenderEnumEnumMap, json['gender']),
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      isLocked: json['isLocked'] as bool?,
      currentSessionId: json['currentSessionId'] as String?,
      lastLoginTime: json['lastLoginTime'] == null
          ? null
          : DateTime.parse(json['lastLoginTime'] as String),
      createdDate: DateTime.parse(json['createdDate'] as String),
      settings: json['userSetting'] == null
          ? null
          : UserSettingModel.fromJson(
              json['userSetting'] as Map<String, dynamic>),
      password: json['password'] as String?,
      profileId: json['profileId'] as String?,
      profileUrl: json['profileUrl'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'active': instance.active,
      'name': instance.fullName,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'gender': _$GenderEnumEnumMap[instance.gender],
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'isLocked': instance.isLocked,
      'currentSessionId': instance.currentSessionId,
      'lastLoginTime': instance.lastLoginTime?.toIso8601String(),
      'createdDate': instance.createdDate.toIso8601String(),
      'userSetting': instance.settings?.toJson(),
      'password': instance.password,
      'profileId': instance.profileId,
      'profileUrl': instance.profileUrl,
    };

const _$GenderEnumEnumMap = {
  GenderEnum.female: 2,
  GenderEnum.male: 1,
  GenderEnum.other: 3,
};
