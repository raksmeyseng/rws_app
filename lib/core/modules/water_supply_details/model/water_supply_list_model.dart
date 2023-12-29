import 'package:json_annotation/json_annotation.dart';

import '../../authentication/models/user_model.dart';
import '../../my_draft/models/my_draft_model.dart';

part 'water_supply_list_model.g.dart';

@JsonSerializable(explicitToJson: true)
class WaterSupplyListModel {
  WaterSupplyListModel({
    required this.id,
    required this.createdDate,
    required this.waterSupplyTypeId,
    required this.waterSupplyType,
    required this.address,
    required this.district,
    required this.commune,
    this.village,
    required this.status,
    required this.waterSupplyCode,
    required this.user,
  });

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'created_date')
  DateTime createdDate;
  @JsonKey(name: 'water_supply_type_id')
  int waterSupplyTypeId;
  @JsonKey(name: 'water_supply_type')
  String waterSupplyType;
  @JsonKey(name: 'province_id')
  ProvinceModel address;
  @JsonKey(name: 'district_id')
  DistrictModel district;
  @JsonKey(name: 'commune_id')
  CommuneModel commune;
  @JsonKey(name: 'village_id')
  VillageModel? village;
  @JsonKey(name: 'main_status')
  StatusModel status;
  @JsonKey(name: 'water_supply_code')
  String waterSupplyCode;
  @JsonKey(name: 'created_by')
  UserModel user;

  factory WaterSupplyListModel.fromJson(Map<String, dynamic> json) =>
      _$WaterSupplyListModelFromJson(json);
  Map<String, dynamic> toJson() => _$WaterSupplyListModelToJson(this);
}

@JsonSerializable()
class WaterSupplyListByTypeModel {
  WaterSupplyListByTypeModel({
    required this.id,
    required this.waterSupplyCode,
    required this.waterSupplyTypeEn,
    required this.waterSupplyTypeKh,
    required this.provinceNameKh,
    required this.provinceNameEn,
    required this.districtNameEn,
    required this.districtNameKh,
    required this.communeNameEn,
    required this.communeNameKh,
    required this.villageNameEn,
    required this.villageNameKh,
  });

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'water_supply_code')
  String waterSupplyCode;
  @JsonKey(name: 'water_supply_type_en')
  String waterSupplyTypeEn;
  @JsonKey(name: 'water_supply_type_kh')
  String waterSupplyTypeKh;
  @JsonKey(name: 'province_name_kh')
  String provinceNameKh;
  @JsonKey(name: 'province_name_en')
  String provinceNameEn;
  @JsonKey(name: 'district_name_kh')
  String districtNameKh;
  @JsonKey(name: 'district_name_en')
  String districtNameEn;
  @JsonKey(name: 'commune_name_en')
  String communeNameEn;
  @JsonKey(name: 'commune_name_kh')
  String communeNameKh;
  @JsonKey(name: 'Village_name_kh')
  String villageNameKh;
  @JsonKey(name: 'Village_name_en')
  String villageNameEn;

  factory WaterSupplyListByTypeModel.fromJson(Map<String, dynamic> json) =>
      _$WaterSupplyListByTypeModelFromJson(json);
  Map<String, dynamic> toJson() => _$WaterSupplyListByTypeModelToJson(this);
}
