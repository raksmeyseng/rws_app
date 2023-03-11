// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_payload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshTokenPayloadModel _$RefreshTokenPayloadModelFromJson(
        Map<String, dynamic> json) =>
    RefreshTokenPayloadModel(
      clientId: json['clientId'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$RefreshTokenPayloadModelToJson(
        RefreshTokenPayloadModel instance) =>
    <String, dynamic>{
      'clientId': instance.clientId,
      'refreshToken': instance.refreshToken,
    };
