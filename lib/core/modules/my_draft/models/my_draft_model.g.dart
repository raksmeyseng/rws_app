// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_draft_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyDraftModel _$MyDraftModelFromJson(Map<String, dynamic> json) => MyDraftModel(
      id: json['id'] as int,
      createdBy: json['created_by'] as String,
      createdDate: DateTime.parse(json['created_date'] as String),
      waterSupplyType: json['water_supply_type'] as String,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyDraftModelToJson(MyDraftModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_by': instance.createdBy,
      'created_date': instance.createdDate.toIso8601String(),
      'water_supply_type': instance.waterSupplyType,
      'address': instance.address.toJson(),
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      village: json['village'] as String,
      commune: json['commune'] as String,
      district: json['district'] as String,
      province: json['province'] as String,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'village': instance.village,
      'commune': instance.commune,
      'district': instance.district,
      'province': instance.province,
    };

ProvinceModel _$ProvinceModelFromJson(Map<String, dynamic> json) => 
  ProvinceModel(id: json['id'] as int, nameEn: json['name_en'] as String);

Map<String, dynamic> _$ProvinceModelToJson(ProvinceModel instance) => <String,dynamic>{
  'id': instance.id,
  'name_en' : instance.nameEn
};

DistrictModel _$DistrictModelFromJson(Map<String, dynamic> json) => 
  DistrictModel(id: json['id'] as int, nameEn: json['name_en'] as String);

Map<String, dynamic> _$DistrictModelToJson(DistrictModel instance) => <String,dynamic>{
  'id': instance.id,
  'name_en' : instance.nameEn
};

//Commune
CommuneModel _$CommnueModelFromJson(Map<String, dynamic> json) =>
    CommuneModel(id: json['id'] as int, nameEn: json['name_en'] as String);

Map<String, dynamic> _$CommnueModelToJson(CommuneModel instance) => <String,dynamic>{
  'id': instance.id,
  'name_en' : instance.nameEn
};

//Village
VillageModel _$VillageModelFromJson(Map<String, dynamic> json) =>
    VillageModel(id: json['id'] as int, nameEn: json['name_en'] as String);

Map<String, dynamic> _$VillageModelToJson(VillageModel instance) => <String,dynamic>{
  'id': instance.id,
  'name_en' : instance.nameEn
};

//Status
StatusModel _$StatusModelFromJson(Map<String, dynamic> json) =>
    StatusModel(id: json['id'] as int, statusName: json['status_name'] as String, statusNameKh: json['status_name_kh'] as String);
Map<String, dynamic> _$StatusModelToJson(StatusModel instance) => <String,dynamic>{
  'id': instance.id,
  'status_name' : instance.statusName,
  'status_name_kh': instance.statusNameKh
};
