import 'package:json_annotation/json_annotation.dart';

part 'water_supply_delete_response.g.dart';

@JsonSerializable(explicitToJson: true)
class WaterSupplyDeleteResponseModel {
  WaterSupplyDeleteResponseModel({
    required this.status,
    required this.message,
  });

  @JsonKey(name: 'status')
  int status;
  @JsonKey(name: 'message')
  String message;

  factory WaterSupplyDeleteResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WaterSupplyDeleteResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$WaterSupplyDeleteResponseModelToJson(this);
}
