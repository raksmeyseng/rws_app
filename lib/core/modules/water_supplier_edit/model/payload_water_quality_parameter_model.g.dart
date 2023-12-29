// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payload_water_quality_parameter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayloadWaterQualityParameterModel _$PayloadWaterQualityParameterModelFromJson(
        Map<String, dynamic> json) =>
    PayloadWaterQualityParameterModel(
      value: json['value'] as String,
      isActive: json['is_active'] as bool,
      waterSupplyId: json['water_supply_id'] as int,
      parameterId: json['water_quanlity_check_parameter_id'] as int,
    );

Map<String, dynamic> _$PayloadWaterQualityParameterModelToJson(
        PayloadWaterQualityParameterModel instance) =>
    <String, dynamic>{
      'value': instance.value,
      'is_active': instance.isActive,
      'water_supply_id': instance.waterSupplyId,
      'water_quanlity_check_parameter_id': instance.parameterId,
    };
