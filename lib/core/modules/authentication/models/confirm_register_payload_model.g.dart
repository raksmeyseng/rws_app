// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_register_payload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmRegisterPayloadModel _$ConfirmRegisterPayloadModelFromJson(
        Map<String, dynamic> json) =>
    ConfirmRegisterPayloadModel(
      clientId: json['clientId'] as String,
      phoneNumber: json['phone'] as String,
      otpCode: json['code'] as String,
      fullName: json['name'] as String,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      gender: $enumDecodeNullable(_$GenderEnumEnumMap, json['gender']),
      email: json['email'] as String?,
      session: json['session'] as String?,
    );

Map<String, dynamic> _$ConfirmRegisterPayloadModelToJson(
        ConfirmRegisterPayloadModel instance) =>
    <String, dynamic>{
      'clientId': instance.clientId,
      'phone': instance.phoneNumber,
      'code': instance.otpCode,
      'name': instance.fullName,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'gender': _$GenderEnumEnumMap[instance.gender],
      'email': instance.email,
      'session': instance.session,
    };

const _$GenderEnumEnumMap = {
  GenderEnum.female: 2,
  GenderEnum.male: 1,
  GenderEnum.other: 3,
};
