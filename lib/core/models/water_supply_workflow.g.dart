part of 'water_supply_workflow.dart';

WaterSupplyWorkFlowModel _$WaterSupplyWorkFlowModelToJson(Map<String,dynamic> json) =>
WaterSupplyWorkFlowModel(
  id: json['id'] as int,
  waterSupplyId: json['watersupply_id'] as int, 
  status: StatusModel.fromJson(json['status_id'] as Map<String,dynamic>), 
  user: UserModel.fromJson(json['user_id'] as Map<String,dynamic>), 
  createdAt: json['created_at'] as String, 
  remark: json['remark'] as String
  );