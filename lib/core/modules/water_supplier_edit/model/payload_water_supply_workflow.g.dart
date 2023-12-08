// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payload_water_supply_workflow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayloadWaterSupplyWorkflow _$PayloadWaterSupplyWorkflowFromJson(
        Map<String, dynamic> json) =>
    PayloadWaterSupplyWorkflow(
      waterSupplyId: json['watersupply_id'] as int,
      status: json['status_id'] as int,
      user: json['user_id'] as int,
      remark: json['remark'] as String?,
    );

Map<String, dynamic> _$PayloadWaterSupplyWorkflowToJson(
        PayloadWaterSupplyWorkflow instance) =>
    <String, dynamic>{
      'watersupply_id': instance.waterSupplyId,
      'status_id': instance.status,
      'user_id': instance.user,
      'remark': instance.remark,
    };
