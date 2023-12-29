// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_supply_small_pipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WaterSupplySmallPipeModel _$WaterSupplySmallPipeModelFromJson(
        Map<String, dynamic> json) =>
    WaterSupplySmallPipeModel(
      id: json['id'] as int,
      waterSupplyId: json['watersupply_id'] as int,
      abilityOfProductWater: json['abilty_of_produce_water'] as String,
      underGroudPoolStorage: json['underground_pool_storage'] as String,
      numberOfLink: json['number_of_link'] as String,
      poolFilter: json['pool_filter'] as String,
      poolAir: json['pool_air'] as String,
      poolFilterObj: (json['pool_filter_obj'] as List<dynamic>)
          .map((e) =>
              WaterSupplyOptionValueModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      wateQualityCheckObj: (json['water_quality_check_obj'] as List<dynamic>)
          .map((e) =>
              WaterSupplyOptionValueModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusObj: (json['status_obj'] as List<dynamic>)
          .map((e) =>
              WaterSupplyOptionValueModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      sourceTypeOfWater: (json['source_type_of_water'] as List<dynamic>)
          .map(
              (e) => WaterSupplyOptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pipeLength: json['pipe_length'] as String,
      areaCovering: json['area_covering'] as String,
    );

Map<String, dynamic> _$WaterSupplySmallPipeModelToJson(
        WaterSupplySmallPipeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'watersupply_id': instance.waterSupplyId,
      'abilty_of_produce_water': instance.abilityOfProductWater,
      'underground_pool_storage': instance.underGroudPoolStorage,
      'number_of_link': instance.numberOfLink,
      'pool_air': instance.poolAir,
      'pool_filter': instance.poolFilter,
      'pipe_length': instance.pipeLength,
      'area_covering': instance.areaCovering,
      'pool_filter_obj': instance.poolFilterObj.map((e) => e.toJson()).toList(),
      'water_quality_check_obj':
          instance.wateQualityCheckObj.map((e) => e.toJson()).toList(),
      'status_obj': instance.statusObj.map((e) => e.toJson()).toList(),
      'source_type_of_water':
          instance.sourceTypeOfWater.map((e) => e.toJson()).toList(),
    };

WaterSupplyOptionModel _$WaterSupplyOptionModelFromJson(
        Map<String, dynamic> json) =>
    WaterSupplyOptionModel(
      id: json['id'] as int,
      waterSupplySmallPipeId: json['water_supply_pipe_id'] as int,
      optionId: json['option_id'] as int,
      valueId: json['value_id'] as int,
      valueObjs: (json['value_obj'] as List<dynamic>)
          .map((e) =>
              WaterSupplyOptionValueModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WaterSupplyOptionModelToJson(
        WaterSupplyOptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'water_supply_pipe_id': instance.waterSupplySmallPipeId,
      'option_id': instance.optionId,
      'value_id': instance.valueId,
      'value_obj': instance.valueObjs.map((e) => e.toJson()).toList(),
    };

WaterSupplyOptionValueModel _$WaterSupplyOptionValueModelFromJson(
        Map<String, dynamic> json) =>
    WaterSupplyOptionValueModel(
      id: json['id'] as int,
      code: json['code'] as String,
      nameEn: json['name_en'] as String,
      nameKh: json['name_kh'] as String,
      waterSupplyOptionId: json['water_supply_option_id'] as int,
    );

Map<String, dynamic> _$WaterSupplyOptionValueModelToJson(
        WaterSupplyOptionValueModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name_en': instance.nameEn,
      'name_kh': instance.nameKh,
      'water_supply_option_id': instance.waterSupplyOptionId,
    };
