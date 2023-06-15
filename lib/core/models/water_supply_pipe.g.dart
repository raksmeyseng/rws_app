part of 'water_supply_pipe.dart';

WaterSupplyPipeModel _$WaterSupplyPipeModelFromJson(Map<String,dynamic> json)=>
WaterSupplyPipeModel(
  id: json['id'] as int, 
  waterSupplyId: json['watersupply_id'] as int, 
  sourceTypeOfWater: json['source_type_of_water'] as String, 
  abilityOfProductWater: json['abilty_of_produce_water'] as String, 
  underGroudPoolStorage: json['underground_pool_storage'] as String
  );