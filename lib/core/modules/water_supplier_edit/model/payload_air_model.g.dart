part of 'payload_air_model.dart';

PayloadairModel _$PayloadairModelFromJson(Map<String,dynamic> json)=>
PayloadairModel(
  waterSupplyId: json['watersupply_id'] as int,
  id: json['id'] as int,
  sourceTypeOfWater: json['source_type_of_water'] as String,
  abiltyOfProduceWater: json['abilty_of_produce_water'] as String, 
  filterSystem: json['filter_system'] as String,
  waterQualityChecking: json['water_quality_checking'] as String, 
  status: json['status'] as String, 
  statusNoReason: json['status_no_reason'] as String, 
 /*   filterSystemObj: json['filter_system_obj'] as String,  */
  isActive: json['is_active'] as bool,
  );

Map<String,dynamic> _$PayloadairModelToJson(PayloadairModel instance)=>
<String,dynamic>{
  'watersupply_id':instance.waterSupplyId,
  'source_type_of_water': instance.sourceTypeOfWater,
  'abilty_of_produce_water': instance.abiltyOfProduceWater,
  'filter_system':instance.filterSystem,
  'water_quality_checking':instance.waterQualityChecking, 
  'status':instance.status,
  'status_no_reason':instance.statusNoReason,
  'is_active':instance.isActive,
/*   'filter_system_obj':instance.filterSystemObj, */
  'id':instance.id

};

PayloadairOptionValueModel _$PayloadairOptionValueModelFromJson(Map<String,dynamic> json)=>
PayloadairOptionValueModel(
  waterSupplyWellId: json['water_supply_airwater_id'] as int, 
  optionId: json['option_id'] as int, 
  valueId: json['value_id'] as int, 
  isActive: json['is_active'] as bool
  );

Map<String,dynamic> _$PayloadairOptionValueModelToJson(PayloadairOptionValueModel instance)=>
<String,dynamic>{
  'water_supply_airwater_id':instance.waterSupplyWellId,
  'option_id':instance.optionId,
  'value_id':instance.valueId,
  'is_active' : instance.isActive
};