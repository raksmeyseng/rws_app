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

@JsonSerializable(explicitToJson: true)
class ProvinceModel {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name_en')
  String nameEn;
  @JsonKey(name: 'provincedistrict')
  List<DistrictModel>? provincedistrict;

  ProvinceModel({
    required this.id,
    required this.nameEn,
    this.provincedistrict,
  });

  factory ProvinceModel.fromJson(Map<String, dynamic> json) =>
      _$ProvinceModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProvinceModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DistrictModel {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name_en')
  String nameEn;
  @JsonKey(name: 'districtcommnue')
  List<CommuneModel>? districtCommnue;

  DistrictModel({
    required this.id,
    required this.nameEn,
    this.districtCommnue,
  });

  factory DistrictModel.fromJson(Map<String, dynamic> json) =>
      _$DistrictModelFromJson(json);
  Map<String, dynamic> toJson() => _$DistrictModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CommuneModel {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name_en')
  String nameEn;
  @JsonKey(name: 'commnuevillage')
  List<VillageModel>? commnuevillage;

  CommuneModel({
    required this.id,
    required this.nameEn,
    this.commnuevillage,
  });

  factory CommuneModel.fromJson(Map<String, dynamic> json) =>
      _$CommuneModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommuneModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class VillageModel {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name_en')
  String nameEn;

  VillageModel({required this.id, required this.nameEn});
  factory VillageModel.fromJson(Map<String, dynamic> json) =>
      _$VillageModelFromJson(json);
  Map<String, dynamic> toJson() => _$VillageModelToJson(this);
}

@JsonSerializable()
class StatusModel {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'status_name')
  String statusName;
  @JsonKey(name: 'status_name_kh')
  String statusNameKh;

  StatusModel(
      {required this.id, required this.statusName, required this.statusNameKh});
  factory StatusModel.fromJson(Map<String, dynamic> json) =>
      _$StatusModelFromJson(json);
  Map<String, dynamic> toJson() => _$StatusModelToJson(this);
}
