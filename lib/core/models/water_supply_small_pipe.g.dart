part of 'water_supply_small_pipe.dart';

WaterSupplySmallPipeModel _$WaterSupplySmallPipeModelFromJson(
    Map<String, dynamic> json) =>
    WaterSupplySmallPipeModel(
        id: json['id'] as int,
        waterSupplyId: json['watersupply_id'] as int,
        abilityOfProductWater: json['abilty_of_produce_water'] as String,
        underGroudPoolStorage: json['underground_pool_storage'] as String,
        number_of_link: json['number_of_link'] as String,
        pool_air: json['pool_air'] as String,
        pool_filter: json['pool_filter'] as String,
        pool_filter_obj: (json['pool_filter_obj'] as List<dynamic>)
          .map((e) => WaterSupplyOptionValueModel.fromJson(e as Map<String, dynamic>)).toList(),
        water_quality_check_obj: (json['water_quality_check_obj'] as List<dynamic>)
          .map((e) => WaterSupplyOptionValueModel.fromJson(e as Map<String, dynamic>)).toList(),
        status_obj: (json['status_obj'] as List<dynamic>)
          .map((e) => WaterSupplyOptionValueModel.fromJson(e as Map<String, dynamic>)).toList(),
        source_type_of_water: (json['watersupplypipeoptionvalue_watersupplypipe'] as List<dynamic>)
          .map((e) => WaterSupplyOptionModel.fromJson(e as Map<String, dynamic>)).toList(),
       );

Map<String, dynamic> _$WaterSupplySmallPipeModelToJson(
    WaterSupplySmallPipeModel instance) =>
    <String, dynamic>{
            'id': instance.id,
            'watersupply_id': instance.waterSupplyId,
            'abilty_of_produce_water': instance.abilityOfProductWater,
            'underground_pool_storage': instance.underGroudPoolStorage,
            'number_of_link': instance.number_of_link,
            'pool_air': instance.pool_air,
            'pool_filter': instance.pool_filter,           
            'pool_filter_obj': instance.pool_filter_obj?.map((e) => e.toJson()).toList(),
            'water_quality_check_obj': instance.water_quality_check_obj?.map((e) => e.toJson()).toList(),
            'status_obj': instance.status_obj?.map((e) => e.toJson()).toList(),
            'source_type_of_water': instance.source_type_of_water?.map((e) => e.toJson()).toList(),

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
