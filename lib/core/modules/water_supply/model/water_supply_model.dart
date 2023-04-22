import 'package:json_annotation/json_annotation.dart';

part 'water_supply_model.g.dart';

@JsonSerializable()
class WaterSupplyTypeModel {
  WaterSupplyTypeModel({
    required this.id,
    required this.name,
  });

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String name;

  factory WaterSupplyTypeModel.fromJson(Map<String, dynamic> json) =>
      _$WaterSupplyTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$WaterSupplyTypeModelToJson(this);
}
