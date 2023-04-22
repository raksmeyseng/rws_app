// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_supply_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WaterSupplyModel _$WaterSupplyModelFromJson(Map<String, dynamic> json) =>
    WaterSupplyModel(
      id: json['id'] as int,
      createdBy: json['created_by'] as String,
      createdDate: DateTime.parse(json['created_date'] as String),
      waterSupplyType: json['water_supply_type'] as String,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WaterSupplyModelToJson(WaterSupplyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_by': instance.createdBy,
      'created_date': instance.createdDate.toIso8601String(),
      'water_supply_type': instance.waterSupplyType,
      'address': instance.address.toJson(),
    };
