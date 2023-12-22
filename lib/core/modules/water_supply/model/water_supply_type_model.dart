import 'package:json_annotation/json_annotation.dart';

part 'water_supply_type_model.g.dart';

@JsonSerializable()
class WaterSupplyTypeModel {
  WaterSupplyTypeModel(
      {required this.id, required this.name, required this.name_en});

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name_kh')
  String name;
  @JsonKey(name: 'name_en')
  String name_en;

  factory WaterSupplyTypeModel.fromJson(Map<String, dynamic> json) =>
      _$WaterSupplyTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$WaterSupplyTypeModelToJson(this);
}
