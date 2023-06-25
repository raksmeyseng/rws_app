import 'package:json_annotation/json_annotation.dart';

part 'payload_water_quality_parameter_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PayloadWaterQualityParameterModel{

  PayloadWaterQualityParameterModel({
    required this.value,
    required this.isActive,
    required this.waterSupplyId,
    required this.parameterId
  });

  @JsonKey(name:'value')
  String value;
  @JsonKey(name:'is_active')
  bool isActive;
  @JsonKey(name:'water_supply_id')
  int waterSupplyId;
  @JsonKey(name:'water_quanlity_check_parameter_id')
  int parameterId;

  factory PayloadWaterQualityParameterModel.fromJson(Map<String, dynamic> json) =>
      _$PayloadWaterQualityParameterModelFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadWaterQualityParameterModelToJson(this);

}