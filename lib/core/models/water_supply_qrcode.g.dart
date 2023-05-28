// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_supply_qrcode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WaterSupplyQRCodeModel _$WaterSupplyQRCodeModelFromJson(
        Map<String, dynamic> json) =>
    WaterSupplyQRCodeModel(
      id: json['id'] as int,
      waterSupplyId: json['watersupply_id'] as int,
      qrCodeImageName: json['qr_code_image_name'] as String,
    );

Map<String, dynamic> _$WaterSupplyQRCodeModelToJson(
        WaterSupplyQRCodeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'watersupply_id': instance.waterSupplyId,
      'qr_code_image_name': instance.qrCodeImageName,
    };
