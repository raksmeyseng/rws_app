// import 'dart:html';

import 'package:json_annotation/json_annotation.dart';

part 'water_quality_parameter.g.dart';

@JsonSerializable(explicitToJson: true)
class WaterQualityParameterModel{

  WaterQualityParameterModel({
    required this.id,
    required this.parameterCode,
    required this.parameter,
    required this.unit,
    required this.standartOfDrinkingWater

  });

  @JsonKey(name:'id')
  int id;
  @JsonKey(name:'parameter_code')
  String parameterCode;
  @JsonKey(name:'parameter')
  String parameter;
  @JsonKey(name:'unit')
  String unit;
  @JsonKey(name:'standard_of_drinking_water')
  String standartOfDrinkingWater;

  factory WaterQualityParameterModel.fromJson(Map<String, dynamic> json) =>
      _$WaterQualityParameterToJson(json);


}

@JsonSerializable(explicitToJson: true)
class WaterSupplyWaterQualityParameterModel{

  WaterSupplyWaterQualityParameterModel({
    required this.id,
    required this.waterSupplyId,
    required this.parameter,
    required this.value
  });

  @JsonKey(name:'id')
  int id;
  @JsonKey(name:'water_supply_id')
  int waterSupplyId;
  @JsonKey(name:'water_quanlity_check_parameter_id')
  WaterQualityParameterModel parameter;
  @JsonKey(name:'value')
  String value;

  factory WaterSupplyWaterQualityParameterModel.fromJson(Map<String, dynamic> json) =>
      _$WaterSupplyWaterQualityParameterModelToJson(json);

}