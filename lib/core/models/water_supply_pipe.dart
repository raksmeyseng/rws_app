import 'package:json_annotation/json_annotation.dart';

part 'water_supply_pipe.g.dart';

@JsonSerializable(explicitToJson: true)
class WaterSupplyPipeModel {
  WaterSupplyPipeModel({
    required this.id,
    required this.watersupplyId,
    required this.isActive,
    required this.sourceTypeOfWater,
    required this.abiltyOfProduceWater,
    required this.undergroundPoolStorage,
    required this.poolAir,
    required this.poolFilter,
    required this.numberOfLink,
    required this.waterQualityCheck,
    required this.status,
    required this.statusNoReason,
    required this.pipeLength,
    required this.areaCovering,
    required this.licenseExpiredDate,
    required this.licenseRegisteredDate,

    required this.poolFilterObj,
    required this.pipeWaterQualityCheckObj,
    required this.pipeStatusObj,
    required this.isHasLicenseObj,
    required this.watersupplypipeoptionvalueWatersupplypipe,
  
  });

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'watersupply_id')
  int watersupplyId;
  @JsonKey(name: 'is_active')
  bool isActive;
  @JsonKey(name: 'source_type_of_water')
  String sourceTypeOfWater;
  @JsonKey(name: 'abilty_of_produce_water')
  String abiltyOfProduceWater;
  @JsonKey(name: 'underground_pool_storage')
  String undergroundPoolStorage;
  @JsonKey(name: 'pool_air')
  String poolAir;
  @JsonKey(name: 'pool_filter')
  String poolFilter;
  @JsonKey(name: 'number_of_link')
  String numberOfLink;
  @JsonKey(name: 'water_quality_check')
  String waterQualityCheck;
  @JsonKey(name: 'status')
  String status;
  @JsonKey(name: 'status_no_reason')
  String statusNoReason;
  @JsonKey(name: 'pipe_length')
  String pipeLength;
  @JsonKey(name: 'area_covering')
  String areaCovering;
  @JsonKey(name: 'license_registered_date')
  String licenseRegisteredDate;
  @JsonKey(name: 'license_expired_date')
  String licenseExpiredDate;

  @JsonKey(name: 'pool_filter_obj')
  List<WaterSupplyOptionValueModel>? poolFilterObj;
  @JsonKey(name: 'water_quality_check_obj')
  List<WaterSupplyOptionValueModel>? pipeWaterQualityCheckObj;
  @JsonKey(name: 'status_obj')
  List<WaterSupplyOptionValueModel>? pipeStatusObj;
  @JsonKey(name: 'is_has_license_obj')
  List<WaterSupplyOptionValueModel>? isHasLicenseObj;

  @JsonKey(name: 'watersupplypipeoptionvalue_watersupplypipe')
  List<WaterSupplyOptionModel>? watersupplypipeoptionvalueWatersupplypipe;

  factory WaterSupplyPipeModel.fromJson(Map<String, dynamic> json) =>
      _$WaterSupplyPipeModelFromJson(json);
  Map<String, dynamic> toJson() => _$WaterSupplyPipeModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class WaterSupplyOptionModel {
  WaterSupplyOptionModel({
    required this.id,
    required this.waterSupplyPipeId,
    required this.optionId,
    required this.valueId,
    required this.valueObjs,
  });

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'water_supply_pipe_id')
  int waterSupplyPipeId;
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
