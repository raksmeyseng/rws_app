// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payload_rain_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayloadRainModel _$PayloadRainModelFromJson(Map<String, dynamic> json) =>
    PayloadRainModel(
      waterSupplyId: json['watersupply_id'] as int,
      typeOfUsing: json['type_of_using'] as String,
      capacityOfRainWaterHarvesting:
          json['capacity_of_rain_water_harvesting'] as String,
      status: json['status'] as String,
      statusNoReason: json['status_no_reason'] as String,
      isActive: json['is_active'] as bool,
      waterQualityChecking: json['water_quality_checking'] as String,
      capacity35m3: json['capacity_35m3'] as int,
      capacity4m3: json['capacity_4m3'] as int,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$PayloadRainModelToJson(PayloadRainModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'watersupply_id': instance.waterSupplyId,
      'is_active': instance.isActive,
      'type_of_using': instance.typeOfUsing,
      'capacity_of_rain_water_harvesting':
          instance.capacityOfRainWaterHarvesting,
      'status': instance.status,
      'status_no_reason': instance.statusNoReason,
      'water_quality_checking': instance.waterQualityChecking,
      'capacity_35m3': instance.capacity35m3,
      'capacity_4m3': instance.capacity4m3,
    };

PayloadRainOptionValueModel _$PayloadRainOptionValueModelFromJson(
        Map<String, dynamic> json) =>
    PayloadRainOptionValueModel(
      waterSupplyWellId: json['water_supply_well_id'] as int,
      optionId: json['option_id'] as int,
      valueId: json['value_id'] as int,
      isActive: json['is_active'] as bool,
    );

Map<String, dynamic> _$PayloadRainOptionValueModelToJson(
        PayloadRainOptionValueModel instance) =>
    <String, dynamic>{
      'water_supply_well_id': instance.waterSupplyWellId,
      'option_id': instance.optionId,
      'value_id': instance.valueId,
      'is_active': instance.isActive,
    };
