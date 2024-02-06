// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_water_supply_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseWaterSupplyModel _$ResponseWaterSupplyModelFromJson(
        Map<String, dynamic> json) =>
    ResponseWaterSupplyModel(
      status: json['status'] as int,
      waterSupplyId: json['data']['id'] as int,
    );

Map<String, dynamic> _$ResponseWaterSupplyModelToJson(
        ResponseWaterSupplyModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.waterSupplyId,
    };
