// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_payload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterPayloadModel _$RegisterPayloadModelFromJson(
        Map<String, dynamic> json) =>
    RegisterPayloadModel(
      clientId: json['clientId'] as String,
      phoneNumber: json['phone'] as String,
      hashed: json['hashed'] as String,
      appSignature: json['appSignature'] as String?,
    );

Map<String, dynamic> _$RegisterPayloadModelToJson(
        RegisterPayloadModel instance) =>
    <String, dynamic>{
      'clientId': instance.clientId,
      'phone': instance.phoneNumber,
      'hashed': instance.hashed,
      'appSignature': instance.appSignature,
    };
