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
