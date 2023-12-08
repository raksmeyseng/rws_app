// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payload_water_supply_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayloadWaterSupplyModel _$PayloadWaterSupplyModelFromJson(
        Map<String, dynamic> json) =>
    PayloadWaterSupplyModel(
      createdBy: json['created_by'] as int,
      province: json['province_id'] as int,
      district: json['district_id'] as int,
      commune: json['commune_id'] as int,
      village: json['village_id'] as int,
      mapUnitId: json['map_unit'] as int,
      decimalDegreeLat: (json['decimal_degress_lat'] as num).toDouble(),
      decimalDegreeLng: (json['decimal_degress_lng'] as num).toDouble(),
      utmX: (json['utm_x'] as num).toDouble(),
      utmY: (json['utm_y'] as num).toDouble(),
      mdsXDegree: (json['mds_x_degress'] as num).toDouble(),
      mdsXMinute: (json['mds_x_minute'] as num).toDouble(),
      mdsXSecond: (json['mds_x_second'] as num).toDouble(),
      mdsYDegree: (json['mds_y_degree'] as num).toDouble(),
      mdsYMinute: (json['mds_y_minute'] as num).toDouble(),
      mdsYSecond: (json['mds_y_second'] as num).toDouble(),
      totalFamily: json['total_family'] as int,
      beneficiaryTotalFamily: json['beneficiary_total_family'] as int,
      beneficiaryTotalFamilyIndigenous:
          json['beneficiary_total_family_indigenous'] as int,
      beneficiaryTotalFamilyPoor1:
          json['beneficiary_total_family_poor_1'] as int,
      beneficiaryTotalFamilyPoor2:
          json['beneficiary_total_family_poor_2'] as int,
      beneficiaryTotalFamilyVulnearable:
          json['beneficiary_total_family_vulnerable'] as int,
      beneficiaryTotalPeople: json['beneficiary_total_people'] as int,
      beneficiaryTotalWoman: json['beneficiary_total_women'] as int,
      constructedBy: json['constructed_by'] as String,
      constructionDate: json['construction_date'] as String,
      isRiskEnviromentArea: json['is_risk_enviroment_area'] as bool,
      managedBy: json['managed_by'] as String,
      managementType: json['management_type'] as int,
      sourceBudget: json['source_budget'] as int,
      waterSupplyTypeId: json['water_supply_type_id'] as int,
      isActive: json['is_active'] as bool,
      mainStatus: json['main_status'] as int,
      updatedBy: json['updated_by'] as int,
      waterSupplyCode: json['water_supply_code'] as String,
      isWaterQualityCheck: json['is_water_quality_check'] as bool,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$PayloadWaterSupplyModelToJson(
        PayloadWaterSupplyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'is_active': instance.isActive,
      'water_supply_type_id': instance.waterSupplyTypeId,
      'province_id': instance.province,
      'district_id': instance.district,
      'commune_id': instance.commune,
      'village_id': instance.village,
      'map_unit': instance.mapUnitId,
      'decimal_degress_lat': instance.decimalDegreeLat,
      'decimal_degress_lng': instance.decimalDegreeLng,
      'utm_x': instance.utmX,
      'utm_y': instance.utmY,
      'mds_x_degress': instance.mdsXDegree,
      'mds_x_minute': instance.mdsXMinute,
      'mds_x_second': instance.mdsXSecond,
      'mds_y_degree': instance.mdsYDegree,
      'mds_y_minute': instance.mdsYMinute,
      'mds_y_second': instance.mdsYSecond,
      'total_family': instance.totalFamily,
      'is_risk_enviroment_area': instance.isRiskEnviromentArea,
      'construction_date': instance.constructionDate,
      'water_supply_code': instance.waterSupplyCode,
      'source_budget': instance.sourceBudget,
      'constructed_by': instance.constructedBy,
      'management_type': instance.managementType,
      'managed_by': instance.managedBy,
      'beneficiary_total_people': instance.beneficiaryTotalPeople,
      'beneficiary_total_women': instance.beneficiaryTotalWoman,
      'beneficiary_total_family': instance.beneficiaryTotalFamily,
      'beneficiary_total_family_poor_1': instance.beneficiaryTotalFamilyPoor1,
      'beneficiary_total_family_poor_2': instance.beneficiaryTotalFamilyPoor2,
      'beneficiary_total_family_vulnerable':
          instance.beneficiaryTotalFamilyVulnearable,
      'beneficiary_total_family_indigenous':
          instance.beneficiaryTotalFamilyIndigenous,
      'main_status': instance.mainStatus,
      'is_water_quality_check': instance.isWaterQualityCheck,
    };
