import 'package:json_annotation/json_annotation.dart';
import 'package:rws_app/core/modules/authentication/models/user_model.dart';
import 'package:rws_app/core/modules/my_draft/models/my_draft_model.dart';

part 'water_supply_workflow.g.dart';

@JsonSerializable(explicitToJson: true)
class WaterSupplyWorkFlowModel{

  WaterSupplyWorkFlowModel({
    required this.id,
    required this.waterSupplyId,
    required this.status,
    required this.user,
    required this.createdAt,
    this.remark

  });
  
  @JsonKey(name:'id')
  int id;
  @JsonKey(name:'watersupply_id')
  int waterSupplyId;
  @JsonKey(name:'status_id')
  StatusModel status;
  @JsonKey(name:'user_id')
  UserModel user;
  @JsonKey(name:'created_at')
  String createdAt;
  @JsonKey(name:'remark')
  String? remark;

  factory WaterSupplyWorkFlowModel.fromJson(Map<String, dynamic> json) =>
      _$WaterSupplyWorkFlowModelToJson(json);

}