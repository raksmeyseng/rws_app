// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_supply_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WaterSupplyTypeModel _$WaterSupplyTypeModelFromJson(
        Map<String, dynamic> json) =>
    WaterSupplyTypeModel(
      id: json['id'] as int,
      name: json['name_kh'] as String,
      name_en: json['name_en'] as String,
    );

Map<String, dynamic> _$WaterSupplyTypeModelToJson(
        WaterSupplyTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_kh': instance.name,
      'name_en': instance.name_en
    };
