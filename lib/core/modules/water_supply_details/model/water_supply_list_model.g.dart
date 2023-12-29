// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_supply_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WaterSupplyListModel _$WaterSupplyListModelFromJson(
        Map<String, dynamic> json) =>
    WaterSupplyListModel(
      id: json['id'] as int,
      createdDate: DateTime.parse(json['created_date'] as String),
      waterSupplyTypeId: json['water_supply_type_id'] as int,
      waterSupplyType: json['water_supply_type'] as String,
      address:
          ProvinceModel.fromJson(json['province_id'] as Map<String, dynamic>),
      district:
          DistrictModel.fromJson(json['district_id'] as Map<String, dynamic>),
      commune:
          CommuneModel.fromJson(json['commune_id'] as Map<String, dynamic>),
      village: json['village_id'] == null
          ? null
          : VillageModel.fromJson(json['village_id'] as Map<String, dynamic>),
      status: StatusModel.fromJson(json['main_status'] as Map<String, dynamic>),
      waterSupplyCode: json['water_supply_code'] as String,
      user: UserModel.fromJson(json['created_by'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WaterSupplyListModelToJson(
        WaterSupplyListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_date': instance.createdDate.toIso8601String(),
      'water_supply_type_id': instance.waterSupplyTypeId,
      'water_supply_type': instance.waterSupplyType,
      'province_id': instance.address.toJson(),
      'district_id': instance.district.toJson(),
      'commune_id': instance.commune.toJson(),
      'village_id': instance.village?.toJson(),
      'main_status': instance.status.toJson(),
      'water_supply_code': instance.waterSupplyCode,
      'created_by': instance.user.toJson(),
    };

WaterSupplyListByTypeModel _$WaterSupplyListByTypeModelFromJson(
        Map<String, dynamic> json) =>
    WaterSupplyListByTypeModel(
      id: json['id'] as int,
      waterSupplyCode: json['water_supply_code'] as String,
      waterSupplyTypeEn: json['water_supply_type_id']['name_en'] as String,
      waterSupplyTypeKh: json['water_supply_type_id']['name_kh'] as String,
      provinceNameKh: json['province_id']['name_kh'] as String,
      provinceNameEn: json['province_id']['name_en'] as String,
      districtNameEn: json['district_id']['name_en'] as String,
      districtNameKh: json['district_id']['name_kh'] as String,
      communeNameEn: json['commune_id']['name_en'] as String,
      communeNameKh: json['commune_id']['name_kh'] as String,
      villageNameEn: json['village_id']['name_en'] as String,
      villageNameKh: json['village_id']['name_kh'] as String,
    );

Map<String, dynamic> _$WaterSupplyListByTypeModelToJson(
        WaterSupplyListByTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'water_supply_code': instance.waterSupplyCode,
      'water_supply_type_en': instance.waterSupplyTypeEn,
      'water_supply_type_kh': instance.waterSupplyTypeKh,
      'province_name_kh': instance.provinceNameKh,
      'province_name_en': instance.provinceNameEn,
      'district_name_kh': instance.districtNameKh,
      'district_name_en': instance.districtNameEn,
      'commune_name_en': instance.communeNameEn,
      'commune_name_kh': instance.communeNameKh,
      'Village_name_kh': instance.villageNameKh,
      'Village_name_en': instance.villageNameEn,
    };
