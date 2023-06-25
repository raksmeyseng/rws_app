import 'package:json_annotation/json_annotation.dart';
part 'water_supply_rain_g.dart';
@JsonSerializable(explicitToJson: true)
class WaterSupplyRainModel {
  WaterSupplyRainModel({
  
    required this.waterSupplyId,
    required this.statusNoReason,
    required this.typeOfUsing,
    required this.capacityOfRainWaterHarvesting,
    required this.statusObj,
     required this.waterQualityCheckObj,

  });
  
  @JsonKey(name:'watersupply_id')
  int waterSupplyId;
  @JsonKey(name:'status_no_reason')
  String statusNoReason;

  @JsonKey(name: 'water_quality_checking_obj')
  List<WaterSupplyOptionValueModel> waterQualityCheckObj;
  @JsonKey(name: 'status_obj')
  List<WaterSupplyOptionValueModel> statusObj;
  @JsonKey(name: 'capacity_of_rain_water_harvesting_obj')
  List<WaterSupplyOptionValueModel> capacityOfRainWaterHarvesting;
  @JsonKey(name: 'type_of_using_obj')
  List<WaterSupplyOptionValueModel> typeOfUsing;


  factory WaterSupplyRainModel.fromJson(Map<String, dynamic> json) =>
      _$WaterSupplyRainModelFromJson(json);
  Map<String, dynamic> toJson() => _$WaterSupplyRainModelToJson(this);
}

/* @JsonSerializable(explicitToJson: true)
class WaterSupplyOptionModel {
  WaterSupplyOptionModel({
    required this.id,
    required this.waterSupplySmallPipeId,    
    required this.optionId,
    required this.valueId,
    required this.valueObjs,
  });

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'water_supply_pipe_id')
  int waterSupplySmallPipeId;
  @JsonKey(name: 'option_id')
  int optionId;
  @JsonKey(name: 'value_id')
  int valueId;
  @JsonKey(name: 'value_obj')
  List<WaterSupplyOptionValueModel> valueObjs;

  factory WaterSupplyOptionModel.fromJson(Map<String, dynamic> json) =>
      _$WaterSupplyOptionModelFromJson(json);
  Map<String, dynamic> toJson() => _$WaterSupplyOptionModelToJson(this);
} */

@JsonSerializable(explicitToJson: true)
class WaterSupplyOptionValueModel {
  WaterSupplyOptionValueModel({
    required this.id,
    required this.code,
    required this.nameEn,
    required this.nameKh,
    required this.waterSupplyOptionId,
  });

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'code')
  String code;
  @JsonKey(name: 'name_en')
  String nameEn;
  @JsonKey(name: 'name_kh')
  String nameKh;
  @JsonKey(name: 'water_supply_option_id')
  int waterSupplyOptionId;

  factory WaterSupplyOptionValueModel.fromJson(Map<String, dynamic> json) =>
      _$WaterSupplyOptionValueModelFromJson(json);
  Map<String, dynamic> toJson() => _$WaterSupplyOptionValueModelToJson(this);
}
