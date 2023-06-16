
part of 'water_supply_pipe.dart';

WaterSupplyPipeModel _$WaterSupplyWellModelFromJson(
    Map<String, dynamic> json) =>
    WaterSupplyPipeModel(
          id: json['id'] as int,
          watersupplyId: json['watersupply_id'] as int,
          isActive: json['well_height'] as String,
          sourceTypeOfWater: json['well_filter_height'] as String,
          abiltyOfProduceWater: json['well_nirodynamic'] as String,
          undergroundPoolStorage: json['well_nirostatic'] as String,
          poolAir: json['well_status'] as String,
          poolFilter: json['well_status_reason'] as String,
          numberOfLink: json['well_watar_quality'] as String,
          waterQualityCheck: json['well_water_quality_check'] as String,
          status: json['well_water_supply'] as String,
          statusNoReason: json['well_water_supply'] as String,
          poolFilterObj: (json['well_watar_quality_obj'] as List<dynamic>?)
              ?.map((e) =>
              WaterSupplyOptionValueModel.fromJson(e as Map<String, dynamic>))
              .toList(),
          pipeWaterQualityCheckObj: (json['well_water_quality_check_obj']
          as List<dynamic>?)
              ?.map((e) =>
              WaterSupplyOptionValueModel.fromJson(e as Map<String, dynamic>))
              .toList(),
          pipeLength: json['pipe_length'] as String,
          areaCovering: json['area_covering'] as String,
          pipeStatusObj: (json['well_water_quality_check_obj']
          as List<dynamic>?)
              ?.map((e) =>
              WaterSupplyOptionValueModel.fromJson(e as Map<String, dynamic>))
              .toList(),
          watersupplypipeoptionvalueWatersupplypipe: (json['well_water_quality_check_obj']
          as List<dynamic>?)
              ?.map((e) =>
              WaterSupplyOptionModel.fromJson(e as Map<String, dynamic>))
              .toList(),

    );

Map<String, dynamic> _$WaterSupplyPipeModelToJson(
    WaterSupplyPipeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'watersupply_id': instance.id,
      'is_active': instance.watersupplyId,
      'source_type_of_water': instance.isActive,
      'abilty_of_produce_water': instance.sourceTypeOfWater,
      'underground_pool_storage': instance.abiltyOfProduceWater,
      'pool_air': instance.undergroundPoolStorage,
      'pool_filter': instance.poolAir,
      'number_of_link': instance.numberOfLink,
      'water_quality_check': instance.waterQualityCheck,
      'status': instance.status,
      'status_no_reason': instance.statusNoReason,
      'pool_filter_obj':
      instance.poolFilterObj?.map((e) => e.toJson()).toList(),
      'water_quality_check_obj':
      instance.pipeWaterQualityCheckObj?.map((e) => e.toJson()).toList(),
      'status_obj':
      instance.pipeStatusObj?.map((e) => e.toJson()).toList(),
      'watersupplypipeoptionvalue_watersupplypipe':
      instance.watersupplypipeoptionvalueWatersupplypipe?.map((e) => e.toJson()).toList(),
      'pipe_length': instance.pipeLength,
      'area_covering': instance.areaCovering,
    };

WaterSupplyOptionModel _$WaterSupplyOptionModelFromJson(
    Map<String, dynamic> json) =>
    WaterSupplyOptionModel(
          id: json['id'] as int,
          waterSupplyPipeId: json['water_supply_pipe_id'] as int,
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
      'water_supply_pipe_id': instance.waterSupplyPipeId,
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

