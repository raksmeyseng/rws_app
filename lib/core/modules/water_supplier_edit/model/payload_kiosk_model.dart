import 'package:json_annotation/json_annotation.dart';

part 'payload_kiosk_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PayloadKioskModel{

  PayloadKioskModel({
    required this.waterSupplyId,
    required this.sourceTypeOfWater,
    required this.abilityOfProductWater,
    required this.filterSystem,
    required this.waterQualityChecking,
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
  @JsonKey(name:'source_type_of_water')
  String sourceTypeOfWater;
  @JsonKey(name:'abilty_of_produce_water')
  String abilityOfProductWater;
  @JsonKey(name:'filter_system')
  String filterSystem;
  @JsonKey(name:'water_quality_checking')
  String waterQualityChecking;
  @JsonKey(name:'status')
  String status;
  @JsonKey(name:'status_no_reason')
  String statusNoReason;

  
  factory PayloadKioskModel.fromJson(Map<String, dynamic> json) =>
      _$PayloadKioskModelFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadKioskModelToJson(this);

}

@JsonSerializable(explicitToJson: true)
class PayloadKioskOptionValueModel{

  PayloadKioskOptionValueModel({
    required this.waterSupplyKioskId,
    required this.optionId,
    required this.valueId,
    required this.isActive,
    this.id
  });

  @JsonKey(name:'id')
  int? id;
  @JsonKey(name:'water_supply_kiosk_id')
  int waterSupplyKioskId;
  @JsonKey(name:'option_id')
  int optionId;
  @JsonKey(name:'value_id')
  int valueId;
  @JsonKey(name:'is_active')
  bool isActive;

  factory PayloadKioskOptionValueModel.fromJson(Map<String, dynamic> json) =>
      _$PayloadKioskOptionValueModelFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadKioskOptionValueModelToJson(this);

}