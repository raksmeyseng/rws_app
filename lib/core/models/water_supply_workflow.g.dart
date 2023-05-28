// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_supply_workflow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WaterSupplyWorkFlowModel _$WaterSupplyWorkFlowModelFromJson(
        Map<String, dynamic> json) =>
    WaterSupplyWorkFlowModel(
      id: json['id'] as int,
      waterSupplyId: json['watersupply_id'] as int,
      status: StatusModel.fromJson(json['status_id'] as Map<String, dynamic>),
      user: UserModel.fromJson(json['user_id'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String,
      remark: json['remark'] as String?,
    );

Map<String, dynamic> _$WaterSupplyWorkFlowModelToJson(
        WaterSupplyWorkFlowModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'watersupply_id': instance.waterSupplyId,
      'status_id': instance.status.toJson(),
      'user_id': instance.user.toJson(),
      'created_at': instance.createdAt,
      'remark': instance.remark,
    };
