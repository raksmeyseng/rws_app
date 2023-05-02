// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_supply_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// WaterSupplyModel _$WaterSupplyModelFromJson(Map<String, dynamic> json) =>
//     WaterSupplyModel(
//       id: json['id'] as int,
//       createdBy: json['created_by'] as String,
//       createdDate: DateTime.parse(json['created_date'] as String),
//       waterSupplyType: json['water_supply_type'] as String,
//       address: Address.fromJson(json['address'] as Map<String, dynamic>),
//     );

    WaterSupplyModel _$WaterSupplyModelFromJson(Map<String, dynamic> json) =>
    WaterSupplyModel(
      id: json['id'] as int,
      createdBy: json['created_by']['username'] as String,
      createdDate: DateTime.parse(json['created_at'] as String),
      waterSupplyType: json['water_supply_type_id']['name_kh'] as String,
      address: ProvinceModel.fromJson(json['province_id'] as Map<String, dynamic>),
      district: DistrictModel.fromJson(json['district_id'] as Map<String,dynamic>),
      commune: CommuneModel.fromJson(json['commune_id'] as Map<String,dynamic>),
      village: VillageModel.fromJson(json['village_id'] as Map<String,dynamic>),
      status: StatusModel.fromJson(json['main_status'] as Map<String,dynamic>),
      waterSupplyCode: json['water_supply_code'] as String
      //address: json['province_id']['name_kh'] as String,
    );

Map<String, dynamic> _$WaterSupplyModelToJson(WaterSupplyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_by': instance.createdBy,
      'created_date': instance.createdDate.toIso8601String(),
      'water_supply_type': instance.waterSupplyType,
      'address': instance.address.toJson(),
      'district' : instance.district.toJson(),
      'commune' : instance.commune.toJson(),
      'village':instance.village.toJson(),
      'main_status':instance.status.toJson(),
      'water_supply_code':instance.waterSupplyCode
    };

