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
      //createdBy: json['created_by']['username'] as String,
      createdDate: DateTime.parse(json['created_at'] as String),
      waterSupplyType: json['water_supply_type_id']['name_kh'] as String,
      address: ProvinceModel.fromJson(json['province_id'] as Map<String, dynamic>),
      district: DistrictModel.fromJson(json['district_id'] as Map<String,dynamic>),
      commune: CommuneModel.fromJson(json['commune_id'] as Map<String,dynamic>),
      village: VillageModel.fromJson(json['village_id'] as Map<String,dynamic>),
      status: StatusModel.fromJson(json['main_status'] as Map<String,dynamic>),
      waterSupplyCode: json['water_supply_code'] as String,
      user: UserModel.fromJson(json['created_by'] as Map<String,dynamic>),
      mapUnitId: json['map_unit'] as int,
      decimalDegreeLat: json['decimal_degress_lat'] as String,
      decimalDegreeLng: json['decimal_degress_lng'] as String,
      utmX: json['utm_x'] as String,
      utmY: json['utm_y'] as String,
      mdsXDegree: json['mds_x_degress'] as String,
      mdsXMinute: json['mds_x_minute'] as String,
      mdsXSecond: json['mds_x_second'] as String,
      mdsYDegree: json['mds_y_degress'] as String,
      mdsYMinute: json['mds_y_minute'] as String,
      mdsYSecond: json['mds_y_second'] as String,
      totalFamily:json['total_family'] as int,
      isRiskEnviromentArea: json['is_risk_enviroment_area'] as bool,
      constructionDate:json['construction_date'] as String,
      sourceBudget: json['source_budget'] as int,
      constructedBy:json['constructed_by'] as String,
      managementType: json['management_type'] as int,
      managedBy: json['managed_by'] as String,
      beneficiaryTotalPeople:json['beneficiary_total_people'] as int,
      beneficiaryTotalWoman: json['beneficiary_total_women'] as int,
      beneficiaryTotalFamily:json['beneficiary_total_family'] as int,
      beneficiaryTotalFamilyPoor1:json['beneficiary_total_family_poor_1'] as int,
      beneficiaryTotalFamilyPoor2: json['beneficiary_total_family_poor_2'] as int,
      beneficiaryTotalFamilyVulnearable:json['beneficiary_total_family_vulnerable'] as int,
      beneficiaryTotalFamilyIndigenous: json['beneficiary_total_family_indigenous'] as int
 
      
      //address: json['province_id']['name_kh'] as String,
    );

Map<String, dynamic> _$WaterSupplyModelToJson(WaterSupplyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_by': instance.user.toJson(),
      'created_date': instance.createdDate.toIso8601String(),
      'water_supply_type': instance.waterSupplyType,
      'address': instance.address.toJson(),
      'district' : instance.district.toJson(),
      'commune' : instance.commune.toJson(),
      'village':instance.village.toJson(),
      'main_status':instance.status.toJson(),
      'water_supply_code':instance.waterSupplyCode,
      'map_unit':instance.mapUnitId,
      'decimal_degress_lat':instance.decimalDegreeLat,
      'decimal_degress_lng':instance.decimalDegreeLng,
      'utm_x':instance.utmX,
      'utm_y':instance.utmY,
      'mds_x_degress':instance.mdsXDegree,
      'mds_x_minute':instance.mdsXMinute,
      'mds_x_second':instance.mdsXSecond,
      'mds_y_degress':instance.mdsYDegree,
      'mds_y_minute':instance.mdsYMinute,
      'mds_y_second':instance.mdsYSecond
    };

