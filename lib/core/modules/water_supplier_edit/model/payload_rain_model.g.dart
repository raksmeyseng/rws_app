part of 'payload_rain_model.dart';

PayloadRainModel _$PayloadRainModelFromJson(Map<String,dynamic> json)=>
PayloadRainModel(
  waterSupplyId: json['watersupply_id'] as int,
  id: json['id'] as int,
  typeOfUsing: json['type_of_using'] as String,
  capacityOfRainWaterHarvesting: json['capacity_of_rain_water_harvesting'] as String, 
  status: json['status'] as String, 
  statusNoReason: json['status_no_reason'] as String, 
  isActive: json['is_active'] as bool,
  );

Map<String,dynamic> _$PayloadRainModelToJson(PayloadRainModel instance)=>
<String,dynamic>{
  'watersupply_id': instance.waterSupplyId,
  'type_of_using': instance.typeOfUsing,
  'capacity_of_rain_water_harvesting':instance.capacityOfRainWaterHarvesting,
  'status':instance.status,
  'status_no_reason':instance.statusNoReason,
  'is_active':instance.isActive,
  'id':instance.isActive

};

PayloadRainOptionValueModel _$PayloadRainOptionValueModelFromJson(Map<String,dynamic> json)=>
PayloadRainOptionValueModel(
  waterSupplyWellId: json['water_supply_well_id'] as int, 
  optionId: json['option_id'] as int, 
  valueId: json['value_id'] as int, 
  isActive: json['is_active'] as bool
  );

Map<String,dynamic> _$PayloadRainOptionValueModelToJson(PayloadRainOptionValueModel instance)=>
<String,dynamic>{
  'water_supply_well_id':instance.waterSupplyWellId,
  'option_id':instance.optionId,
  'value_id':instance.valueId,
  'is_active' : instance.isActive
};