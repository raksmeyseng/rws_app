// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_supply_air.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WaterSupplyAirModel _$WaterSupplyAirModelFromJson(
        Map<String, dynamic> json) =>
    WaterSupplyAirModel(
      id: json['id'] as int,
      waterSupplyId: json['watersupply_id'] as int,
      abiltyOfProduceWater: json['abilty_of_produce_water'] as String,
      statusNoReason: json['status_no_reason'] as String,

      filterSystemObj: (json['filter_system_obj'] as List<dynamic>?)
          ?.map((e) => WaterSupplyOptionValueModel.fromJson(e as Map<String, dynamic>)).toList(),
      statusObj: (json['status_obj'] as List<dynamic>?)
          ?.map((e) => WaterSupplyOptionValueModel.fromJson(e as Map<String, dynamic>)).toList(),
      waterQualityCheckObj: (json['water_quality_checking_obj'] as List<dynamic>?)
          ?.map((e) => WaterSupplyOptionValueModel.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$WaterSupplyAirModelToJson(
        WaterSupplyAirModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'watersupply_id': instance.waterSupplyId,
      'abilty_of_produce_water': instance.abiltyOfProduceWater,
      'status_no_reason': instance.statusNoReason,     
      'filter_system_obj':
          instance.filterSystemObj?.map((e) => e.toJson()).toList(),
      'status_obj':
          instance.statusObj?.map((e) => e.toJson()).toList(),
      'water_quality_checking_obj':
          instance.waterQualityCheckObj?.map((e) => e.toJson()).toList(),
  
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
