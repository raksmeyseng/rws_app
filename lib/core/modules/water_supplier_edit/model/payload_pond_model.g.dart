part of 'payload_pond_model.dart';

PayloadPondModel _$PayloadPondModelFromJson(Map<String,dynamic> json)=>
PayloadPondModel(
  waterSupplyId: json['watersupply_id'] as int,
  //id: json['id'] as int,
  width: json['width'] as String,
  length: json['length'] as String, 
  height: json['height'] as String, 
  poolFilter: json['pool_filter'] as String , 
  status: json['status'] as String, 
  statusNoReason: json['status_no_reason'] as String, 
  isActive: json['is_active'] as bool,

  typeOfPond: json['type_of_pond'] as String, 
  isSummerHasWater: json['is_summer_has_water'] as String, 
  //poolFilterObj: json['pool_filter_obj'] as String,
  );

Map<String,dynamic> _$PayloadPondModelToJson(PayloadPondModel instance)=>
<String,dynamic>{
  'watersupply_id': instance.waterSupplyId,
  'width': instance.width,
  'length':instance.length,
  'height':instance.height,
  'pool_filter':instance.poolFilter,
  'status':instance.status,
  'status_no_reason':instance.statusNoReason,
  'is_active':instance.isActive,
  //'id':instance.id,
  'type_of_pond':instance.typeOfPond,
  'is_summer_has_water':instance.isSummerHasWater,
  //'pool_filter_obj':instance.poolFilterObj,

};

PayloadPondOptionValueModel _$PayloadPondOptionValueModelFromJson(Map<String,dynamic> json)=>
PayloadPondOptionValueModel(
  waterSupplyWellId: json['water_supply_well_id'] as int, 
  optionId: json['option_id'] as int, 
  valueId: json['value_id'] as int, 
  isActive: json['is_active'] as bool
  );

Map<String,dynamic> _$PayloadPondOptionValueModelToJson(PayloadPondOptionValueModel instance)=>
<String,dynamic>{
  'water_supply_well_id':instance.waterSupplyWellId,
  'option_id':instance.optionId,
  'value_id':instance.valueId,
  'is_active' : instance.isActive
};