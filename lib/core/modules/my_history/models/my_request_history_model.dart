import 'package:json_annotation/json_annotation.dart';
import 'package:rws_app/core/modules/my_draft/models/my_draft_model.dart';

@JsonSerializable(explicitToJson: true)
class MyReqeustHistoryModel {
  MyReqeustHistoryModel(
      {required this.id,
      required this.waterSupplyType,
      required this.waterSupplyTypeEn,
      required this.address,
      required this.district,
      required this.commune,
      this.village,
      required this.status,
      this.waterSupplyCode,
      required this.waterSupplyTypeId});

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'water_supply_type_id')
  int waterSupplyTypeId;
  @JsonKey(name: 'water_supply_type')
  String waterSupplyType;
  @JsonKey(name: 'water_supply_type')
  String waterSupplyTypeEn;
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
  String? waterSupplyCode;

  factory MyReqeustHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$MyReqeustHistoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$MyReqeustHistoryModelToJson(this);
}

MyReqeustHistoryModel _$MyReqeustHistoryModelFromJson(
        Map<String, dynamic> json) =>
    MyReqeustHistoryModel(
      id: json['id'] as int,
      waterSupplyType: json['water_supply_type_id']['name_kh'] as String,
      waterSupplyTypeEn: json['water_supply_type_id']['name_en'] as String,
      address:
          ProvinceModel.fromJson(json['province_id'] as Map<String, dynamic>),
      district:
          DistrictModel.fromJson(json['district_id'] as Map<String, dynamic>),
      commune:
          CommuneModel.fromJson(json['commune_id'] as Map<String, dynamic>),
      village: json['village_id'] == null
          ? null
          : VillageModel.fromJson(json['village_id']),
      status: StatusModel.fromJson(json['main_status'] as Map<String, dynamic>),
      waterSupplyCode: json['water_supply_code'] as String,
      waterSupplyTypeId: json['water_supply_type_id']['id'] as int,
    );

Map<String, dynamic> _$MyReqeustHistoryModelToJson(
        MyReqeustHistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'water_supply_type_id': instance.waterSupplyTypeId,
      'water_supply_type': instance.waterSupplyType,
      'province_id': instance.address.toJson(),
      'district_id': instance.district.toJson(),
      'commune_id': instance.commune.toJson(),
      'village_id': instance.village?.toJson(),
      'main_status': instance.status.toJson(),
      'water_supply_code': instance.waterSupplyCode,
    };
