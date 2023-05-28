import 'package:json_annotation/json_annotation.dart';

part 'water_supply_well.g.dart';

@JsonSerializable(explicitToJson: true)
class WaterSupplyWellModel {
  WaterSupplyWellModel({
    required this.id,
    required this.waterSupplyId,
    required this.wellHeight,
    required this.wellFilterHeight,
    required this.wellNirodynamic,
    required this.wellNirostatic,
    required this.wellStatus,
    required this.wellStatusReason,
    required this.wellWaterQuality,
    required this.wellWaterQualityCheck,
    required this.wellWaterSupply,
    required this.wellTypeObj,
    this.wellWaterQualityObj,
    this.wellWaterQualityCheckObj,
    this.wellStatusObj,
  });

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'watersupply_id')
  int waterSupplyId;
  @JsonKey(name: 'well_height')
  String wellHeight;
  @JsonKey(name: 'well_filter_height')
  String wellFilterHeight;
  @JsonKey(name: 'well_water_supply')
  String wellWaterSupply;
  @JsonKey(name: 'well_nirostatic')
  String wellNirostatic;
  @JsonKey(name: 'well_watar_quality')
  String wellWaterQuality;
  @JsonKey(name: 'well_water_quality_check')
  String wellWaterQualityCheck;
  @JsonKey(name: 'well_status')
  String wellStatus;
  @JsonKey(name: 'well_status_reason')
  String wellStatusReason;
  @JsonKey(name: 'well_nirodynamic')
  String wellNirodynamic;
  @JsonKey(name: 'well_watar_quality_obj')
  List<WaterSupplyOptionValueModel>? wellWaterQualityObj;
  @JsonKey(name: 'well_water_quality_check_obj')
  List<WaterSupplyOptionValueModel>? wellWaterQualityCheckObj;
  @JsonKey(name: 'well_status_obj')
  List<WaterSupplyOptionValueModel>? wellStatusObj;
  @JsonKey(name: 'well_type_obj')
  List<WaterSupplyOptionModel> wellTypeObj;

  factory WaterSupplyWellModel.fromJson(Map<String, dynamic> json) =>
      _$WaterSupplyWellModelFromJson(json);
  Map<String, dynamic> toJson() => _$WaterSupplyWellModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class WaterSupplyOptionModel {
  WaterSupplyOptionModel({
    required this.id,
    required this.waterSupplyWellId,
    required this.optionId,
    required this.valueId,
    required this.valueObjs,
  });

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'water_supply_well_id')
  int waterSupplyWellId;
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
