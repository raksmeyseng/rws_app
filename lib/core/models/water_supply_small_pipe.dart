import 'package:json_annotation/json_annotation.dart';
part 'water_supply_small_pipe.g.dart';
@JsonSerializable(explicitToJson: true)
class WaterSupplySmallPipeModel {

  WaterSupplySmallPipeModel({
    required this.id,
    required this.waterSupplyId,
    required this.sourceTypeOfWater,
    required this.abilityOfProductWater,
    required this.underGroudPoolStorage
  });
  
  @JsonKey(name:'id')
  int id;
  @JsonKey(name:'watersupply_id')
  int waterSupplyId;
  @JsonKey(name:'source_type_of_water')
  String sourceTypeOfWater;
  @JsonKey(name:'abilty_of_produce_water')
  String abilityOfProductWater;
  @JsonKey(name:'underground_pool_storage')
  String underGroudPoolStorage;

  factory WaterSupplySmallPipeModel.fromJson(Map<String, dynamic> json) =>
      _$WaterSupplyPipeModelFromJson(json);


}
