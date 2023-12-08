// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payload_smallpipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayloadSmallPipeModel _$PayloadSmallPipeModelFromJson(
        Map<String, dynamic> json) =>
    PayloadSmallPipeModel(
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
    );

Map<String, dynamic> _$PayloadSmallPipeModelToJson(
        PayloadSmallPipeModel instance) =>
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
    };

PayloadSmallPipeOptionValueModel _$PayloadSmallPipeOptionValueModelFromJson(
        Map<String, dynamic> json) =>
    PayloadSmallPipeOptionValueModel(
      waterSupplyWellId: json['water_supply_pipe_id'] as int,
      optionId: json['option_id'] as int,
      valueId: json['value_id'] as int,
      isActive: json['is_active'] as bool,
    );

Map<String, dynamic> _$PayloadSmallPipeOptionValueModelToJson(
        PayloadSmallPipeOptionValueModel instance) =>
    <String, dynamic>{
      'water_supply_pipe_id': instance.waterSupplyWellId,
      'option_id': instance.optionId,
      'value_id': instance.valueId,
      'is_active': instance.isActive,
    };
