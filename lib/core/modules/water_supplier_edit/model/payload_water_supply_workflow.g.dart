part of 'payload_water_supply_workflow.dart';

PayloadWaterSupplyWorkflow _$PayloadWaterSupplyModelFromJson(Map<String,dynamic> json) =>
PayloadWaterSupplyWorkflow(
  waterSupplyId: json['watersupply_id'] as int,
  status: json['status_id'] as int,
  user: json['user_id'] as int,
  remark: json['remark'] as String
  );

Map<String,dynamic> _$PayloadWaterSupplyWorkflowToJson(PayloadWaterSupplyWorkflow instance) =>{
  'watersupply_id' : instance.waterSupplyId,
  'status_id':instance.status,
  'user_id':instance.user,
  'remark':instance.remark,
  
};