// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_supply_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WaterSupplyDeleteResponseModel _$WaterSupplyDeleteResponseModelFromJson(
        Map<String, dynamic> json) =>
    WaterSupplyDeleteResponseModel(
      status: json['status'] as int,
      message: json['message'] as String,
    );

Map<String, dynamic> _$WaterSupplyDeleteResponseModelToJson(
        WaterSupplyDeleteResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
