import 'package:json_annotation/json_annotation.dart';

part 'response_water_supply_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseWaterSupplyModel{

  ResponseWaterSupplyModel({
    required this.status,
    required this.waterSupplyId
  });

  @JsonKey(name:'status')
  int status;

  @JsonKey(name:'data')
  int waterSupplyId;
  //PayloadWaterSupplyModel data;

  factory ResponseWaterSupplyModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseWaterSupplyModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseWaterSupplyModelToJson(this);

}