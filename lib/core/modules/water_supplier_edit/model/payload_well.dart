import 'package:json_annotation/json_annotation.dart';

part 'payload_well.g.dart';

@JsonSerializable(explicitToJson: true)
class PayloadWellModel{

  PayloadWellModel({
    required this.waterSupplyId,
    required this.wellType,
    required this.wellHeight,
    required this.wellFilterHeight,
    required this.wellWaterSupply,
    required this.wellNiroStatic,
    required this.wellNiroDynamic,
    required this.wellStatus,
    required this.wellStatusReason,
    required this.wellWaterQuality,
    required this.wellWaterQualityCheck,
    required this.isActive,
    this.id,
  });

  @JsonKey(name:'id')
  int? id;

  @JsonKey(name:'watersupply_id')
  int waterSupplyId;
  @JsonKey(name:'well_type')
  String wellType;
  @JsonKey(name:'well_height')
  String wellHeight;
  @JsonKey(name:'well_filter_height')
  String wellFilterHeight;
  @JsonKey(name:'well_water_supply')
  String wellWaterSupply;
  @JsonKey(name:'well_nirostatic')
  String wellNiroStatic;
  @JsonKey(name:'well_nirodynamic')
  String wellNiroDynamic;
  @JsonKey(name:'well_watar_quality')
  String wellWaterQuality;
  @JsonKey(name:'well_water_quality_check')
  String wellWaterQualityCheck;
  @JsonKey(name:'well_status')
  String wellStatus;
  @JsonKey(name:'well_status_reason')
  String wellStatusReason;
  @JsonKey(name:'is_active')
  bool isActive;
  
  factory PayloadWellModel.fromJson(Map<String, dynamic> json) =>
      _$PayloadWellModelFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadWellModelToJson(this);

}

@JsonSerializable(explicitToJson: true)
class PayloadWellOptionValueModel{

  PayloadWellOptionValueModel({
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
  @JsonKey(name:'value_id')
  bool isActive;

  factory PayloadWellOptionValueModel.fromJson(Map<String, dynamic> json) =>
      _$PayloadWellOptionValueModelFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadWellOptionValueModelToJson(this);

}