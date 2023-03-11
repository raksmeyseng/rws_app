// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterDataModel _$RegisterDataModelFromJson(Map<String, dynamic> json) =>
    RegisterDataModel(
      fullName: json['fullName'] as String,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      gender: $enumDecodeNullable(_$GenderEnumEnumMap, json['gender']),
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String?,
      registerResponse: RegisterResponseModel.fromJson(
          json['registerResponse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterDataModelToJson(RegisterDataModel instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'gender': _$GenderEnumEnumMap[instance.gender],
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'registerResponse': instance.registerResponse,
    };

const _$GenderEnumEnumMap = {
  GenderEnum.female: 2,
  GenderEnum.male: 1,
  GenderEnum.other: 3,
};
