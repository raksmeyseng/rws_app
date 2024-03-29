// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payload_kiosk_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayloadKioskModel _$PayloadKioskModelFromJson(Map<String, dynamic> json) =>
    PayloadKioskModel(
      waterSupplyId: json['watersupply_id'] as int,
      sourceTypeOfWater: json['source_type_of_water'] as String,
      abilityOfProductWater: json['abilty_of_produce_water'] as String,
      filterSystem: json['filter_system'] as String,
      waterQualityChecking: json['water_quality_checking'] as String,
      status: json['status'] as String,
      statusNoReason: json['status_no_reason'] as String,
      isActive: json['is_active'] as bool,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$PayloadKioskModelToJson(PayloadKioskModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'watersupply_id': instance.waterSupplyId,
      'is_active': instance.isActive,
      'source_type_of_water': instance.sourceTypeOfWater,
      'abilty_of_produce_water': instance.abilityOfProductWater,
      'filter_system': instance.filterSystem,
      'water_quality_checking': instance.waterQualityChecking,
      'status': instance.status,
      'status_no_reason': instance.statusNoReason,
    };

PayloadKioskOptionValueModel _$PayloadKioskOptionValueModelFromJson(
        Map<String, dynamic> json) =>
    PayloadKioskOptionValueModel(
      waterSupplyKioskId: json['water_supply_kiosk_id'] as int,
      optionId: json['option_id'] as int,
      valueId: json['value_id'] as int,
      isActive: json['is_active'] as bool,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$PayloadKioskOptionValueModelToJson(
        PayloadKioskOptionValueModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'water_supply_kiosk_id': instance.waterSupplyKioskId,
      'option_id': instance.optionId,
      'value_id': instance.valueId,
      'is_active': instance.isActive,
    };
