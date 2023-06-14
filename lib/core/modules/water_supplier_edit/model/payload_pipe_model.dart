import 'package:json_annotation/json_annotation.dart';

part 'payload_pipe_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PayloadPipeModel{

  PayloadPipeModel({
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

}