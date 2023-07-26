import 'package:json_annotation/json_annotation.dart';

part 'payload_rain_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PayloadRainModel{

  PayloadRainModel({
    required this.waterSupplyId,
    required this.typeOfUsing,
    required this.capacityOfRainWaterHarvesting,   
    required this.status,
    required this.statusNoReason,
    required this.isActive,
    this.id,
  });

  @JsonKey(name:'id')
  int? id;
  @JsonKey(name:'watersupply_id')
  int waterSupplyId;
  @JsonKey(name:'is_active')
  bool isActive;
  @JsonKey(name:'type_of_using')
  String typeOfUsing;
  @JsonKey(name:'capacity_of_rain_water_harvesting')
  String capacityOfRainWaterHarvesting;
  @JsonKey(name:'status')
  String status;
  @JsonKey(name:'status_no_reason')
  String statusNoReason;

  
  factory PayloadRainModel.fromJson(Map<String, dynamic> json) =>
      _$PayloadRainModelFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadRainModelToJson(this);

}

@JsonSerializable(explicitToJson: true)
class PayloadRainOptionValueModel{

  PayloadRainOptionValueModel({
    required this.waterSupplyWellId,
    required this.optionId,
    required this.valueId,
    required this.isActive
  });

  @JsonKey(name:'water_supply_well_id')
  int waterSupplyWellId;
  @JsonKey(name:'option_id')
  int optionId;
  @JsonKey(name:'value_id')
  int valueId;
  @JsonKey(name:'is_active')
  bool isActive;

  factory PayloadRainOptionValueModel.fromJson(Map<String, dynamic> json) =>
      _$PayloadRainOptionValueModelFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadRainOptionValueModelToJson(this); 

}