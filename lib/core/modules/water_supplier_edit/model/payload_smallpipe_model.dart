import 'package:json_annotation/json_annotation.dart';

part 'payload_smallpipe_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PayloadSmallPipeModel{

  PayloadSmallPipeModel({
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
    required this.statusNoReason
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

  
  factory PayloadSmallPipeModel.fromJson(Map<String, dynamic> json) =>
      _$PayloadSmallPipeModelFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadSmallPipeModelToJson(this);


}


@JsonSerializable(explicitToJson: true)
class PayloadSmallPipeOptionValueModel{

  PayloadSmallPipeOptionValueModel({
    required this.waterSupplyWellId,
    required this.optionId,
    required this.valueId,
    required this.isActive
  });

  @JsonKey(name:'water_supply_pipe_id')
  int waterSupplyWellId;
  @JsonKey(name:'option_id')
  int optionId;
  @JsonKey(name:'value_id')
  int valueId;
  @JsonKey(name:'is_active')
  bool isActive;

  factory PayloadSmallPipeOptionValueModel.fromJson(Map<String, dynamic> json) =>
      _$PayloadSmallPipeOptionValueModelFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadSmallPipeOptionValueModelToJson(this);

}