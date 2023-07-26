import 'package:json_annotation/json_annotation.dart';

part 'payload_air_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PayloadairModel{

  PayloadairModel({
    required this.waterSupplyId,
    required this.sourceTypeOfWater,
    required this.abiltyOfProduceWater,
    required this.filterSystem, 
    required this.waterQualityChecking,
    required this.status,
    required this.statusNoReason,
    required this.isActive,
    //required this.filterSystemObj,
    this.id,
  });

  @JsonKey(name:'id')
  int? id;
  @JsonKey(name:'watersupply_id')
  int waterSupplyId;
  @JsonKey(name:'is_active')
  bool isActive;
  @JsonKey(name:'source_type_of_water')
  String sourceTypeOfWater;
  @JsonKey(name:'abilty_of_produce_water')
  String abiltyOfProduceWater;
  @JsonKey(name:'filter_system')
  String filterSystem;
   @JsonKey(name:'water_quality_checking')
  String waterQualityChecking;
  @JsonKey(name:'status')
  String status;
  @JsonKey(name:'status_no_reason')
  String statusNoReason;
/*    @JsonKey(name:'filter_system_obj')
  String filterSystemObj; */

  
  factory PayloadairModel.fromJson(Map<String, dynamic> json) =>
      _$PayloadairModelFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadairModelToJson(this);

}

@JsonSerializable(explicitToJson: true)
class PayloadairOptionValueModel{

  PayloadairOptionValueModel({
    required this.waterSupplyWellId,
    required this.optionId,
    required this.valueId,
    required this.isActive
  });

  @JsonKey(name:'water_supply_airwater_id')
  int waterSupplyWellId;
  @JsonKey(name:'option_id')
  int optionId;
  @JsonKey(name:'value_id')
  int valueId;
  @JsonKey(name:'is_active')
  bool isActive;

  factory PayloadairOptionValueModel.fromJson(Map<String, dynamic> json) =>
      _$PayloadairOptionValueModelFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadairOptionValueModelToJson(this);

}