part of 'water_quality_parameter.dart';

WaterQualityParameterModel _$WaterQualityParameterToJson(Map<String,dynamic> json)=>
WaterQualityParameterModel(
  id: json['id'] as int, 
  parameterCode: json['parameter_code'] as String,
  parameter: json['parameter'] as String, 
  unit: json['unit'] as String, 
  standartOfDrinkingWater: json['standard_of_drinking_water'] as String
  );


WaterSupplyWaterQualityParameterModel _$WaterSupplyWaterQualityParameterModelToJson(Map<String,dynamic> json)=>
WaterSupplyWaterQualityParameterModel(
  id: json['id'] as int,
  waterSupplyId: json['water_supply_id'] as int,
  parameter: WaterQualityParameterModel.fromJson(json['water_quanlity_check_parameter_id'] as Map<String,dynamic>),
  value: json['value'] as String
  );