// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_supply_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WaterSupplyModel _$WaterSupplyModelFromJson(Map<String, dynamic> json) =>
    WaterSupplyModel(
      id: json['id'] as int,
      createdDate: json['created_date'] == null
          ? DateTime.now()
          : DateTime.parse(json['created_date'] as String),
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
          : VillageModel.fromJson(json['village_id'] as Map<String, dynamic>),
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
      mdsYDegree:
          json['mds_y_degree'] == null ? '' : json['mds_y_degree'] as String,
      mdsYMinute:
          json['mds_y_minute'] == null ? '' : json['mds_y_minute'] as String,
      mdsYSecond:
          json['mds_y_second'] == null ? '' : json['mds_y_second'] as String,
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
      waterSupplyTypeId: json['water_supply_type_id']['id'] as int,
      isWaterQualityCheck: json['is_water_quality_check'] as bool,
      waterSupplyWells: (json['watersupplywell_watersupply'] as List<dynamic>?)
          ?.map((e) => WaterSupplyWellModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      waterSupplyPipes: (json['watersupplypipe_watersupply'] as List<dynamic>?)
          ?.map((e) =>
              WaterSupplySmallPipeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      watersupplykiosks: (json['watersupplyKiosk_watersupply']
              as List<dynamic>?)
          ?.map(
              (e) => WaterSupplyKioskModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      waterSupplyPipe: (json['watersupplypipeprivate_watersupply']
              as List<dynamic>?)
          ?.map((e) => WaterSupplyPipeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      waterSupplyCommunityPond: (json['watersupplyCommunityPond_watersupply']
              as List<dynamic>?)
          ?.map((e) => WaterSupplyPondModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      waterSupplyRainWaterHarvesting: (json[
              'watersupplyRainWaterHarvesting_watersupply'] as List<dynamic>?)
          ?.map((e) => WaterSupplyRainModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      waterSupplyAirWater: (json['watersupplyairwater_watersupply']
              as List<dynamic>?)
          ?.map((e) => WaterSupplyAirModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      workflows: (json['watersupplyworkflow_watersupply'] as List<dynamic>?)
          ?.map((e) =>
              WaterSupplyWorkFlowModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      qrcode: (json['watersupplyqrcode_watersupply'] as List<dynamic>?)
          ?.map(
              (e) => WaterSupplyQRCodeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      wqcParam1: (json['wqc_param1_obj'] as List<dynamic>?)
          ?.map((e) => WaterSupplyWaterQualityParameterModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      wqcParam2: (json['wqc_param2_obj'] as List<dynamic>?)
          ?.map((e) => WaterSupplyWaterQualityParameterModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      wqcParam3: (json['wqc_param3_obj'] as List<dynamic>?)
          ?.map((e) => WaterSupplyWaterQualityParameterModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      wqcParam4: (json['wqc_param4_obj'] as List<dynamic>?)
          ?.map((e) => WaterSupplyWaterQualityParameterModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      wqcParam5: (json['wqc_param5_obj'] as List<dynamic>?)
          ?.map((e) => WaterSupplyWaterQualityParameterModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      wqcParam10: (json['wqc_param10_obj'] as List<dynamic>?)
          ?.map((e) => WaterSupplyWaterQualityParameterModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      wqcParam11: (json['wqc_param11_obj'] as List<dynamic>?)
          ?.map((e) => WaterSupplyWaterQualityParameterModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      wqcParam12: (json['wqc_param12_obj'] as List<dynamic>?)
          ?.map((e) => WaterSupplyWaterQualityParameterModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      wqcParam13: (json['wqc_param13_obj'] as List<dynamic>?)
          ?.map((e) => WaterSupplyWaterQualityParameterModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      wqcParam14: (json['wqc_param14_obj'] as List<dynamic>?)
          ?.map((e) => WaterSupplyWaterQualityParameterModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      wqcParam15: (json['wqc_param15_obj'] as List<dynamic>?)
          ?.map((e) => WaterSupplyWaterQualityParameterModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      wqcParam16: (json['wqc_param16_obj'] as List<dynamic>?)
          ?.map((e) => WaterSupplyWaterQualityParameterModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      wqcParam6: (json['wqc_param6_obj'] as List<dynamic>?)
          ?.map((e) => WaterSupplyWaterQualityParameterModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      wqcParam7: (json['wqc_param7_obj'] as List<dynamic>?)
          ?.map((e) => WaterSupplyWaterQualityParameterModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      wqcParam8: (json['wqc_param8_obj'] as List<dynamic>?)
          ?.map((e) => WaterSupplyWaterQualityParameterModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      wqcParam9: (json['wqc_param9_obj'] as List<dynamic>?)
          ?.map((e) => WaterSupplyWaterQualityParameterModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WaterSupplyModelToJson(WaterSupplyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_date': instance.createdDate?.toIso8601String(),
      'water_supply_type_id': instance.waterSupplyTypeId,
      'water_supply_type': instance.waterSupplyType,
      'province_id': instance.address.toJson(),
      'district_id': instance.district.toJson(),
      'commune_id': instance.commune.toJson(),
      'village_id': instance.village?.toJson(),
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
      'is_water_quality_check': instance.isWaterQualityCheck,
      'watersupplyworkflow_watersupply':
          instance.workflows?.map((e) => e.toJson()).toList(),
      'watersupplyqrcode_watersupply':
          instance.qrcode?.map((e) => e.toJson()).toList(),
      'watersupplywell_watersupply':
          instance.waterSupplyWells?.map((e) => e.toJson()).toList(),
      'watersupplypipe_watersupply':
          instance.waterSupplyPipes?.map((e) => e.toJson()).toList(),
      'watersupplyKiosk_watersupply':
          instance.watersupplykiosks?.map((e) => e.toJson()).toList(),
      'watersupplyCommunityPond_watersupply':
          instance.waterSupplyCommunityPond?.map((e) => e.toJson()).toList(),
      'watersupplyRainWaterHarvesting_watersupply': instance
          .waterSupplyRainWaterHarvesting
          ?.map((e) => e.toJson())
          .toList(),
      'watersupplypipeprivate_watersupply':
          instance.waterSupplyPipe?.map((e) => e.toJson()).toList(),
      'watersupplyairwater_watersupply':
          instance.waterSupplyAirWater?.map((e) => e.toJson()).toList(),
      'wqc_param1_obj': instance.wqcParam1?.map((e) => e.toJson()).toList(),
      'wqc_param2_obj': instance.wqcParam2?.map((e) => e.toJson()).toList(),
      'wqc_param3_obj': instance.wqcParam3?.map((e) => e.toJson()).toList(),
      'wqc_param4_obj': instance.wqcParam4?.map((e) => e.toJson()).toList(),
      'wqc_param5_obj': instance.wqcParam5?.map((e) => e.toJson()).toList(),
      'wqc_param6_obj': instance.wqcParam6?.map((e) => e.toJson()).toList(),
      'wqc_param7_obj': instance.wqcParam7?.map((e) => e.toJson()).toList(),
      'wqc_param8_obj': instance.wqcParam8?.map((e) => e.toJson()).toList(),
      'wqc_param9_obj': instance.wqcParam9?.map((e) => e.toJson()).toList(),
      'wqc_param10_obj': instance.wqcParam10?.map((e) => e.toJson()).toList(),
      'wqc_param11_obj': instance.wqcParam11?.map((e) => e.toJson()).toList(),
      'wqc_param12_obj': instance.wqcParam12?.map((e) => e.toJson()).toList(),
      'wqc_param13_obj': instance.wqcParam13?.map((e) => e.toJson()).toList(),
      'wqc_param14_obj': instance.wqcParam14?.map((e) => e.toJson()).toList(),
      'wqc_param15_obj': instance.wqcParam15?.map((e) => e.toJson()).toList(),
      'wqc_param16_obj': instance.wqcParam16?.map((e) => e.toJson()).toList(),
    };
