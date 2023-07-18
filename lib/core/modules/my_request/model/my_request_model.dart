import 'package:json_annotation/json_annotation.dart';
import 'package:rws_app/core/modules/my_draft/models/my_draft_model.dart';
import 'package:rws_app/core/modules/water_supply_details/model/water_supply_model.dart';

@JsonSerializable(explicitToJson: true)
class MyRequestModel{

  MyRequestModel({
    required this.id,
    required this.waterSupply,
    required this.status,
    required this.createdAt,
    required this.remark
  });

  @JsonKey(name:'id')
  int id;
  @JsonKey(name:'watersupply_id')
  WaterSupplyModel waterSupply;
  @JsonKey(name:'status_id')
  StatusModel status;
  @JsonKey(name:'created_at')
  String createdAt;
  @JsonKey(name:'remark')
  String remark;

  factory MyRequestModel.fromJson(Map<String,dynamic> json)=> _$MyRequestModelFromJson(json);
  Map<String,dynamic> toJson() => _$MyRequestModelToJson(this);


}

MyRequestModel _$MyRequestModelFromJson(Map<String, dynamic> json)=>MyRequestModel(
    id: json['id'],
    remark: json['remark'],
    createdAt: json['created_at'],
    waterSupply: WaterSupplyModel.fromJson(json['watersupply_id'] as Map<String,dynamic>),
    status: StatusModel.fromJson(json['status_id'] as Map<String,dynamic>)

);

Map<String, dynamic> _$MyRequestModelToJson(MyRequestModel instance)=>
    <String,dynamic>{
      'id':instance.id,
      'water_supply_id':instance.waterSupply.toJson(),
      'status_id':instance.status.toJson(),
      'created_at':instance.createdAt,
      'remark':instance.remark
    };