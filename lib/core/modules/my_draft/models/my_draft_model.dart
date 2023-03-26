import 'package:json_annotation/json_annotation.dart';

part 'my_draft_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MyDraftModel {
  MyDraftModel({
    required this.id,
    required this.createdBy,
    required this.createdDate,
    required this.waterSupplyType,
    required this.address,
  });

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'created_by')
  String createdBy;
  @JsonKey(name: 'created_date')
  DateTime createdDate;
  @JsonKey(name: 'water_supply_type')
  String waterSupplyType;
  @JsonKey(name: 'address')
  Address address;

  factory MyDraftModel.fromJson(Map<String, dynamic> json) =>
      _$MyDraftModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyDraftModelToJson(this);
}

@JsonSerializable()
class Address {
  @JsonKey(name: 'village')
  String village;
  @JsonKey(name: 'commune')
  String commune;
  @JsonKey(name: 'district')
  String district;
  @JsonKey(name: 'province')
  String province;

  Address({
    required this.village,
    required this.commune,
    required this.district,
    required this.province,
  });
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
