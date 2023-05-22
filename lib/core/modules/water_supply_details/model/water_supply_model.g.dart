// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_supply_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WaterSupplyModel _$WaterSupplyModelFromJson(Map<String, dynamic> json) =>
    WaterSupplyModel(
      id: json['id'] as int,
      createdDate: DateTime.parse(json['created_date'] as String),
      waterSupplyType: json['water_supply_type'] as String,
      address:
          ProvinceModel.fromJson(json['province_id'] as Map<String, dynamic>),
      district:
          DistrictModel.fromJson(json['district_id'] as Map<String, dynamic>),
      commune:
          CommuneModel.fromJson(json['commune_id'] as Map<String, dynamic>),
      village:
          VillageModel.fromJson(json['village_id'] as Map<String, dynamic>),
      status: StatusModel.fromJson(json['main_status'] as Map<String, dynamic>),
      waterSupplyCode: json['water_supply_code'] as String,
      user: UserModel.fromJson(json['created_by'] as Map<String, dynamic>),
      mapUnitId: json['map_unit'] as int,
      decimalDegreeLat: json['decimal_degress_lat'] as String,
      decimalDegreeLng: json['decimal_degress_lng'] as String,
      utmX: json['utm_x'] as String,
      utmY: json['utm_y'] as String,
      mdsXDegree: json['mds_x_degress'] as String,
      mdsXMinute: json['mds_x_minute'] as String,
      mdsXSecond: json['mds_x_second'] as String,
      mdsYDegree: json['mds_y_degree'] as String,
      mdsYMinute: json['mds_y_minute'] as String,
      mdsYSecond: json['mds_y_second'] as String,
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
      waterSupplyWells: (json['watersupplywell_watersupply'] as List<dynamic>?)
          ?.map((e) => WaterSupplyWellModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WaterSupplyModelToJson(WaterSupplyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_date': instance.createdDate.toIso8601String(),
      'water_supply_type_id': instance.waterSupplyTypeId,
      'water_supply_type': instance.waterSupplyType,
      'province_id': instance.address.toJson(),
      'district_id': instance.district.toJson(),
      'commune_id': instance.commune.toJson(),
      'village_id': instance.village.toJson(),
      'main_status': instance.status.toJson(),
      'water_supply_code': instance.waterSupplyCode,
      'created_by': instance.user.toJson(),
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
      'watersupplywell_watersupply':
          instance.waterSupplyWells?.map((e) => e.toJson()).toList(),
    };
