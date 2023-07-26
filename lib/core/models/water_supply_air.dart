import 'package:json_annotation/json_annotation.dart';

part 'water_supply_air_g.dart';

@JsonSerializable(explicitToJson: true)
class WaterSupplyAirModel {
  WaterSupplyAirModel({
    required this.id,
    required this.waterSupplyId,
    required this.statusNoReason,
    required this.abiltyOfProduceWater,
    required this.filterSystemObj,
    required this.statusObj,
    required this.waterQualityCheckObj,

  });

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'watersupply_id')
  int waterSupplyId; 
  @JsonKey(name: 'abilty_of_produce_water')
  String abiltyOfProduceWater; 
  @JsonKey(name: 'status_no_reason')
  String statusNoReason;


  @JsonKey(name: 'filter_system_obj')
  List<WaterSupplyOptionValueModel>? filterSystemObj;
  @JsonKey(name: 'status_obj')
  List<WaterSupplyOptionValueModel>? statusObj;
  @JsonKey(name: 'well_water_quality_check_obj')
  List<WaterSupplyOptionValueModel>? waterQualityCheckObj;

  factory WaterSupplyAirModel.fromJson(Map<String, dynamic> json) =>
      _$WaterSupplyAirModelFromJson(json);
  Map<String, dynamic> toJson() => _$WaterSupplyAirModelToJson(this);
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
