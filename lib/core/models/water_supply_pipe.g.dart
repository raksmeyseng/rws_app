// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_supply_pipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WaterSupplyPipeModel _$WaterSupplyPipeModelFromJson(
        Map<String, dynamic> json) =>
    WaterSupplyPipeModel(
      id: json['id'] as int,
      watersupplyId: json['watersupply_id'] as int,
      isActive: json['is_active'] as bool,
      sourceTypeOfWater: json['source_type_of_water'] as String,
      abiltyOfProduceWater: json['abilty_of_produce_water'] as String,
      undergroundPoolStorage: json['underground_pool_storage'] as String,
      poolAir: json['pool_air'] as String,
      poolFilter: json['pool_filter'] as String,
      numberOfLink: json['number_of_link'] as String,
      waterQualityCheck: json['water_quality_check'] as String,
      status: json['status'] as String,
      statusNoReason: json['status_no_reason'] as String,
      pipeLength: json['pipe_length'] as String,
      areaCovering: json['area_covering'] as String,
      licenseExpiredDate: json['license_expired_date'] as String,
      licenseRegisteredDate: json['license_registered_date'] as String,
      poolFilterObj: (json['pool_filter_obj'] as List<dynamic>?)
          ?.map((e) =>
              WaterSupplyOptionValueModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pipeWaterQualityCheckObj: (json['water_quality_check_obj']
              as List<dynamic>?)
          ?.map((e) =>
              WaterSupplyOptionValueModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pipeStatusObj: (json['status_obj'] as List<dynamic>?)
          ?.map((e) =>
              WaterSupplyOptionValueModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isHasLicenseObj: (json['is_has_license_obj'] as List<dynamic>?)
          ?.map((e) =>
              WaterSupplyOptionValueModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      watersupplypipeoptionvalueWatersupplypipe:
          (json['watersupplypipeoptionvalue_watersupplypipe'] as List<dynamic>?)
              ?.map((e) =>
                  WaterSupplyOptionModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$WaterSupplyPipeModelToJson(
        WaterSupplyPipeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'watersupply_id': instance.watersupplyId,
      'is_active': instance.isActive,
      'source_type_of_water': instance.sourceTypeOfWater,
      'abilty_of_produce_water': instance.abiltyOfProduceWater,
      'underground_pool_storage': instance.undergroundPoolStorage,
      'pool_air': instance.poolAir,
      'pool_filter': instance.poolFilter,
      'number_of_link': instance.numberOfLink,
      'water_quality_check': instance.waterQualityCheck,
      'status': instance.status,
      'status_no_reason': instance.statusNoReason,
      'pipe_length': instance.pipeLength,
      'area_covering': instance.areaCovering,
      'license_registered_date': instance.licenseRegisteredDate,
      'license_expired_date': instance.licenseExpiredDate,
      'pool_filter_obj':
          instance.poolFilterObj?.map((e) => e.toJson()).toList(),
      'water_quality_check_obj':
          instance.pipeWaterQualityCheckObj?.map((e) => e.toJson()).toList(),
      'status_obj': instance.pipeStatusObj?.map((e) => e.toJson()).toList(),
      'is_has_license_obj':
          instance.isHasLicenseObj?.map((e) => e.toJson()).toList(),
      'watersupplypipeoptionvalue_watersupplypipe': instance
          .watersupplypipeoptionvalueWatersupplypipe
          ?.map((e) => e.toJson())
          .toList(),
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
