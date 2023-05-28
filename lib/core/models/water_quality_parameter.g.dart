// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_quality_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WaterQualityParameterModel _$WaterQualityParameterModelFromJson(
        Map<String, dynamic> json) =>
    WaterQualityParameterModel(
      id: json['id'] as int,
      parameterCode: json['parameter_code'] as String,
      parameter: json['parameter'] as String,
      unit: json['unit'] as String,
      standartOfDrinkingWater: json['standard_of_drinking_water'] as String,
    );

Map<String, dynamic> _$WaterQualityParameterModelToJson(
        WaterQualityParameterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parameter_code': instance.parameterCode,
      'parameter': instance.parameter,
      'unit': instance.unit,
      'standard_of_drinking_water': instance.standartOfDrinkingWater,
    };

WaterSupplyWaterQualityParameterModel
    _$WaterSupplyWaterQualityParameterModelFromJson(
            Map<String, dynamic> json) =>
        WaterSupplyWaterQualityParameterModel(
          id: json['id'] as int,
          waterSupplyId: json['water_supply_id'] as int,
          parameter: WaterQualityParameterModel.fromJson(
              json['water_quanlity_check_parameter_id']
                  as Map<String, dynamic>),
          value: json['value'] as String,
        );

Map<String, dynamic> _$WaterSupplyWaterQualityParameterModelToJson(
        WaterSupplyWaterQualityParameterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'water_supply_id': instance.waterSupplyId,
      'water_quanlity_check_parameter_id': instance.parameter.toJson(),
      'value': instance.value,
    };
