import 'package:json_annotation/json_annotation.dart';
part 'water_supply_kiosk_g.dart';

@JsonSerializable(explicitToJson: true)
class WaterSupplyKioskModel {
  WaterSupplyKioskModel({
    required this.id,
    required this.waterSupplyId,
    required this.abilityOfProductWater,
    required this.sourceTypeOfWater,
    required this.filterSystemObj,
    required this.statusObj,
    required this.waterQualityCheckingObj,
    required this.statusNoReason,
  });

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'watersupply_id')
  int waterSupplyId;
  @JsonKey(name: 'abilty_of_produce_water')
  String abilityOfProductWater;
  @JsonKey(name: 'status_no_reason')
  String statusNoReason;
  List<WaterSupplyOptionModel> sourceTypeOfWater;
  @JsonKey(name: 'filter_system_obj')
  List<WaterSupplyOptionValueModel> filterSystemObj;
  @JsonKey(name: 'water_quality_checking_obj')
  List<WaterSupplyOptionValueModel> waterQualityCheckingObj;
  @JsonKey(name: 'status_obj')
  List<WaterSupplyOptionValueModel> statusObj;

  factory WaterSupplyKioskModel.fromJson(Map<String, dynamic> json) =>
      _$WaterSupplyKioskModelFromJson(json);
  Map<String, dynamic> toJson() => _$WaterSupplyKioskModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class WaterSupplyOptionModel {
  WaterSupplyOptionModel({
    required this.id,
    required this.waterSupplyKioskId,
    required this.optionId,
    required this.valueId,
    required this.valueObjs,
  });

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'water_supply_kiosk_id')
  int waterSupplyKioskId;
  @JsonKey(name: 'option_id')
  int optionId;
  @JsonKey(name: 'value_id')
  int valueId;
  @JsonKey(name: 'value_obj')
  List<WaterSupplyOptionValueModel> valueObjs;

  factory WaterSupplyOptionModel.fromJson(Map<String, dynamic> json) =>
      _$WaterSupplyOptionModelFromJson(json);
  Map<String, dynamic> toJson() => _$WaterSupplyOptionModelToJson(this);
}

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
