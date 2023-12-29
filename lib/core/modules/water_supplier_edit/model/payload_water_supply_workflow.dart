import 'package:json_annotation/json_annotation.dart';

part 'payload_water_supply_workflow.g.dart';

@JsonSerializable()
class PayloadWaterSupplyWorkflow {
  PayloadWaterSupplyWorkflow({
    required this.waterSupplyId,
    required this.status,
    required this.user,
    this.remark,
  });

  @JsonKey(name: 'watersupply_id')
  int waterSupplyId;
  @JsonKey(name: 'status_id')
  int status;
  @JsonKey(name: 'user_id')
  int user;
  @JsonKey(name: 'remark')
  String? remark;

  factory PayloadWaterSupplyWorkflow.fromJson(Map<String, dynamic> json) =>
      _$PayloadWaterSupplyWorkflowFromJson(json);
  Map<String, dynamic> toJson() => _$PayloadWaterSupplyWorkflowToJson(this);
}
