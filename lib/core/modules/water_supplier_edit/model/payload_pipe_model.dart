import 'package:json_annotation/json_annotation.dart';

part 'payload_pipe_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PayloadPipeModel{

  PayloadPipeModel({
    this.id,
    required this.waterSupplyId,
    required this.isActive,
    required this.sourceTypeOfWater,
    required this.abilityOfProductWater,
    required this.undergroupPoolStorage,
    required this.poolAir,
    required this.poolFilter,
    required this.numberOfLink,
    required this.waterQualityCheck,
    required this.status,
    required this.statusNoReason,
    required this.pipeLength,
    required this.areaCovering,
    required this.isHasLicense,
    required this.licenseExpiredDate,
    required this.licenseRegisteredDate,
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
  @JsonKey(name:'underground_pool_storage')
  String undergroupPoolStorage;
  @JsonKey(name:'pool_air')
  String poolAir;
  @JsonKey(name:'pool_filter')
  String poolFilter;
  @JsonKey(name:'number_of_link')
  String numberOfLink;
  @JsonKey(name:'water_quality_check')
  String waterQualityCheck;
  @JsonKey(name:'status')
  String status;  
  @JsonKey(name:'status_no_reason')
  String statusNoReason;
  @JsonKey(name:'pipe_length')
  String pipeLength;
  @JsonKey(name:'area_covering')
  String areaCovering;
  @JsonKey(name:'is_has_license')
  String isHasLicense;
  @JsonKey(name:'license_registered_date')
  String licenseRegisteredDate;
  @JsonKey(name:'license_expired_date')
  String licenseExpiredDate;

  factory PayloadPipeModel.fromJson(Map<String, dynamic> json) =>
      _$PayloadPipeModelFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadPipeModelToJson(this);


}


@JsonSerializable(explicitToJson: true)
class PayloadPipeOptionValueModel{

  PayloadPipeOptionValueModel({
    required this.waterSupplyPipeId,
    required this.optionId,
    required this.valueId,
    required this.isActive
  });

  @JsonKey(name:'water_supply_pipe_id')
  int waterSupplyPipeId;
  @JsonKey(name:'option_id')
  int optionId;
  @JsonKey(name:'value_id')
  int valueId;
  @JsonKey(name:'is_active')
  bool isActive;

  factory PayloadPipeOptionValueModel.fromJson(Map<String, dynamic> json) =>
      _$PayloadPipeOptionValueModelFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadPipeOptionValueModelToJson(this);

}