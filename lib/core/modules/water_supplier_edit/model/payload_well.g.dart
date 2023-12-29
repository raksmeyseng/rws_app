// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payload_well.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayloadWellModel _$PayloadWellModelFromJson(Map<String, dynamic> json) =>
    PayloadWellModel(
      waterSupplyId: json['watersupply_id'] as int,
      wellType: json['well_type'] as String,
      wellHeight: json['well_height'] as String,
      wellFilterHeight: json['well_filter_height'] as String,
      wellWaterSupply: json['well_water_supply'] as String,
      wellNiroStatic: json['well_nirostatic'] as String,
      wellNiroDynamic: json['well_nirodynamic'] as String,
      wellStatus: json['well_status'] as String,
      wellStatusReason: json['well_status_reason'] as String,
      wellWaterQuality: json['well_watar_quality'] as String,
      wellWaterQualityCheck: json['well_water_quality_check'] as String,
      isActive: json['is_active'] as bool,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$PayloadWellModelToJson(PayloadWellModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'watersupply_id': instance.waterSupplyId,
      'well_type': instance.wellType,
      'well_height': instance.wellHeight,
      'well_filter_height': instance.wellFilterHeight,
      'well_water_supply': instance.wellWaterSupply,
      'well_nirostatic': instance.wellNiroStatic,
      'well_nirodynamic': instance.wellNiroDynamic,
      'well_watar_quality': instance.wellWaterQuality,
      'well_water_quality_check': instance.wellWaterQualityCheck,
      'well_status': instance.wellStatus,
      'well_status_reason': instance.wellStatusReason,
      'is_active': instance.isActive,
    };

PayloadWellOptionValueModel _$PayloadWellOptionValueModelFromJson(
        Map<String, dynamic> json) =>
    PayloadWellOptionValueModel(
      waterSupplyWellId: json['water_supply_well_id'] as int,
      optionId: json['option_id'] as int,
      valueId: json['value_id'] as int,
      isActive: json['is_active'] as bool,
    );

Map<String, dynamic> _$PayloadWellOptionValueModelToJson(
        PayloadWellOptionValueModel instance) =>
    <String, dynamic>{
      'water_supply_well_id': instance.waterSupplyWellId,
      'option_id': instance.optionId,
      'value_id': instance.valueId,
      'is_active': instance.isActive,
    };
