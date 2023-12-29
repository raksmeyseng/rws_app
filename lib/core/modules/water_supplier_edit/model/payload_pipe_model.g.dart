// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payload_pipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayloadPipeModel _$PayloadPipeModelFromJson(Map<String, dynamic> json) =>
    PayloadPipeModel(
      id: json['id'] as int?,
      waterSupplyId: json['watersupply_id'] as int,
      isActive: json['is_active'] as bool,
      sourceTypeOfWater: json['source_type_of_water'] as String,
      abilityOfProductWater: json['abilty_of_produce_water'] as String,
      undergroupPoolStorage: json['underground_pool_storage'] as String,
      poolAir: json['pool_air'] as String,
      poolFilter: json['pool_filter'] as String,
      numberOfLink: json['number_of_link'] as String,
      waterQualityCheck: json['water_quality_check'] as String,
      status: json['status'] as String,
      statusNoReason: json['status_no_reason'] as String,
      pipeLength: json['pipe_length'] as String,
      areaCovering: json['area_covering'] as String,
      isHasLicense: json['is_has_license'] as String,
      licenseExpiredDate: json['license_expired_date'] as String,
      licenseRegisteredDate: json['license_registered_date'] as String,
    );

Map<String, dynamic> _$PayloadPipeModelToJson(PayloadPipeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'watersupply_id': instance.waterSupplyId,
      'is_active': instance.isActive,
      'source_type_of_water': instance.sourceTypeOfWater,
      'abilty_of_produce_water': instance.abilityOfProductWater,
      'underground_pool_storage': instance.undergroupPoolStorage,
      'pool_air': instance.poolAir,
      'pool_filter': instance.poolFilter,
      'number_of_link': instance.numberOfLink,
      'water_quality_check': instance.waterQualityCheck,
      'status': instance.status,
      'status_no_reason': instance.statusNoReason,
      'pipe_length': instance.pipeLength,
      'area_covering': instance.areaCovering,
      'is_has_license': instance.isHasLicense,
      'license_registered_date': instance.licenseRegisteredDate,
      'license_expired_date': instance.licenseExpiredDate,
    };

PayloadPipeOptionValueModel _$PayloadPipeOptionValueModelFromJson(
        Map<String, dynamic> json) =>
    PayloadPipeOptionValueModel(
      waterSupplyPipeId: json['water_supply_pipe_id'] as int,
      optionId: json['option_id'] as int,
      valueId: json['value_id'] as int,
      isActive: json['is_active'] as bool,
    );

Map<String, dynamic> _$PayloadPipeOptionValueModelToJson(
        PayloadPipeOptionValueModel instance) =>
    <String, dynamic>{
      'water_supply_pipe_id': instance.waterSupplyPipeId,
      'option_id': instance.optionId,
      'value_id': instance.valueId,
      'is_active': instance.isActive,
    };
