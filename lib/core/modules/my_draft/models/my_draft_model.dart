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

@JsonSerializable()
class ProvinceModel{
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name_en')
  String nameEn;

  ProvinceModel({
    required this.id,
    required this.nameEn,
  });

factory ProvinceModel.fromJson(Map<String, dynamic> json) => _$ProvinceModelFromJson(json);
Map<String, dynamic> toJson() => _$ProvinceModelToJson(this);


}

@JsonSerializable()
class DistrictModel{
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name_en')
  String nameEn;

  DistrictModel({
    required this.id,
    required this.nameEn,
  });

  factory DistrictModel.fromJson(Map<String, dynamic> json) => _$DistrictModelFromJson(json);
  Map<String, dynamic> toJson() => _$DistrictModelToJson(this);
}

@JsonSerializable()
class CommuneModel{
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name_en')
  String nameEn;

  CommuneModel({
    required this.id,
    required this.nameEn
});
  factory CommuneModel.fromJson(Map<String, dynamic> json) => _$CommnueModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommnueModelToJson(this);

}
@JsonSerializable()
class VillageModel{
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name_en')
  String nameEn;

  VillageModel({
    required this.id,
    required this.nameEn
  });
  factory VillageModel.fromJson(Map<String, dynamic> json) => _$VillageModelFromJson(json);
  Map<String, dynamic> toJson() => _$VillageModelToJson(this);

}

@JsonSerializable()
class StatusModel{
  @JsonKey(name:'id')
  int id;
  @JsonKey(name : 'status_name')
  String statusName;
  @JsonKey(name : 'status_name_kh')
  String statusNameKh;

  StatusModel({
    required this.id,
    required this.statusName,
    required this.statusNameKh
});
  factory StatusModel.fromJson(Map<String, dynamic> json) => _$StatusModelFromJson(json);
  Map<String, dynamic> toJson() => _$StatusModelToJson(this);


}







