
import 'package:json_annotation/json_annotation.dart';
import 'package:rws_app/core/modules/app/widgets/theme_item.dart';

import '../../authentication/models/user_model.dart';
import '../../my_draft/models/my_draft_model.dart';

part 'water_supply_list_model.g.dart';

@JsonSerializable(explicitToJson: true)
class WaterSupplyListModel{

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
    required this.user
  });

  @JsonKey(name: 'id')
  int id;
  // @JsonKey(name: 'created_by')
  // String createdBy;
  @JsonKey(name: 'created_date')
  DateTime createdDate;
  @JsonKey(name:'water_supply_type_id')
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
  @JsonKey(name : 'main_status')
  StatusModel status;
  @JsonKey(name : 'water_supply_code')
  String waterSupplyCode;
  @JsonKey(name:'created_by')
  UserModel user;

  factory WaterSupplyListModel.fromJson(Map<String, dynamic> json) =>
      _$WaterSupplyListModelFromJson(json);
}

@JsonSerializable(explicitToJson: true)
class WaterSupplyListByTypeModel{

  WaterSupplyListByTypeModel({
    required this.id,
    required this.waterSupplyCode,
    required this.waterSupplyTypeEn,
    required this.waterSupplyTypeKh,
    required this.ProvinceNameKh,
    required this.ProvinceNameEn,
    required this.DistrictNameEn,
    required this.DistrictNameKh,
    required this.CommuneNameEn,
    required this.CommuneNameKh,
    required this.VillageNameEn,
    required this.VillageNameKh
  });

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name : 'water_supply_code')
  String waterSupplyCode;
  @JsonKey(name : 'water_supply_type_id')
  String waterSupplyTypeEn;
  @JsonKey(name : 'water_supply_type_id')
  String waterSupplyTypeKh;
  @JsonKey(name : 'province_id')
  String ProvinceNameKh;
  @JsonKey(name : 'province_id')
  String ProvinceNameEn;
  @JsonKey(name : 'district_id')
  String DistrictNameKh;
  @JsonKey(name : 'district_id')
  String DistrictNameEn;
  @JsonKey(name : 'commune_id')
  String CommuneNameEn;
  @JsonKey(name : 'commune_id')
  String CommuneNameKh;
  @JsonKey(name : 'Village_id')
  String VillageNameKh;
  @JsonKey(name : 'Village_id')
  String VillageNameEn;


  factory WaterSupplyListByTypeModel.fromJson(Map<String, dynamic> json) =>
      _$WaterSupplyListByTypeModelFromJson(json);
}