// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_supply_well.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WaterSupplyWellModel _$WaterSupplyWellModelFromJson(
        Map<String, dynamic> json) =>
    WaterSupplyWellModel(
      id: json['id'] as int,
      waterSupplyId: json['watersupply_id'] as int,
      wellHeight: json['well_height'] as String,
      wellFilterHeight: json['well_filter_height'] as String,
      wellNirodynamic: json['well_nirodynamic'] as String,
      wellNirostatic: json['well_nirostatic'] as String,
      wellStatus: json['well_status'] as String,
      wellStatusReason: json['well_status_reason'] as String,
      wellWaterQuality: json['well_watar_quality'] as String,
      wellWaterQualityCheck: json['well_water_quality_check'] as String,
      wellWaterSupply: json['well_water_supply'] as String,
      wellTypeObj: (json['well_type_obj'] as List<dynamic>)
          .map(
              (e) => WaterSupplyOptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      wellWaterQualityObj: (json['well_watar_quality_obj'] as List<dynamic>?)
          ?.map((e) =>
              WaterSupplyOptionValueModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      wellWaterQualityCheckObj: (json['well_water_quality_check_obj']
              as List<dynamic>?)
          ?.map((e) =>
              WaterSupplyOptionValueModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      wellStatusObj: (json['well_status_obj'] as List<dynamic>?)
          ?.map((e) =>
              WaterSupplyOptionValueModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WaterSupplyWellModelToJson(
        WaterSupplyWellModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'watersupply_id': instance.waterSupplyId,
      'well_height': instance.wellHeight,
      'well_filter_height': instance.wellFilterHeight,
      'well_water_supply': instance.wellWaterSupply,
      'well_nirostatic': instance.wellNirostatic,
      'well_watar_quality': instance.wellWaterQuality,
      'well_water_quality_check': instance.wellWaterQualityCheck,
      'well_status': instance.wellStatus,
      'well_status_reason': instance.wellStatusReason,
      'well_nirodynamic': instance.wellNirodynamic,
      'well_watar_quality_obj':
          instance.wellWaterQualityObj?.map((e) => e.toJson()).toList(),
      'well_water_quality_check_obj':
          instance.wellWaterQualityCheckObj?.map((e) => e.toJson()).toList(),
      'well_status_obj':
          instance.wellStatusObj?.map((e) => e.toJson()).toList(),
      'well_type_obj': instance.wellTypeObj.map((e) => e.toJson()).toList(),
    };

WaterSupplyOptionModel _$WaterSupplyOptionModelFromJson(
        Map<String, dynamic> json) =>
    WaterSupplyOptionModel(
      id: json['id'] == null ? 0 : json['id'] as int,
      waterSupplyWellId: json['water_supply_well_id'] == null
          ? 0
          : json['water_supply_well_id'] as int,
      optionId: json['option_id'] as int,
      valueId: json['value_id'] as int,
      valueObjs: json['value_obj'] == null
          ? new List.empty()
          : (json['value_obj'] as List<dynamic>)
              .map((e) => WaterSupplyOptionValueModel.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$WaterSupplyOptionModelToJson(
        WaterSupplyOptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'water_supply_well_id': instance.waterSupplyWellId,
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
