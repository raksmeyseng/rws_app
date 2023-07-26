import 'package:json_annotation/json_annotation.dart';
// import 'package:rws_app/core/models/water_supply_model_pipe/water_supply_pipe.dart';
import 'package:rws_app/core/modules/authentication/models/user_model.dart';
import 'package:rws_app/core/modules/my_draft/models/my_draft_model.dart';

import '../../../models/water_quality_parameter.dart';
import '../../../models/water_supply_small_pipe.dart';
import '../../../models/water_supply_kiosk.dart';
import '../../../models/water_supply_pond.dart';
import '../../../models/water_supply_rain.dart';
import '../../../models/water_supply_air.dart';
import '../../../models/water_supply_pipe.dart';
import '../../../models/water_supply_qrcode.dart';
import '../../../models/water_supply_well.dart';
import '../../../models/water_supply_workflow.dart';

part 'water_supply_model.g.dart';

@JsonSerializable(explicitToJson: true)
class WaterSupplyModel {
  //WaterSupplyModel();

  WaterSupplyModel({
    required this.id,
    //required this.createdBy,
    required this.createdDate,
    required this.waterSupplyType,
    required this.address,
    required this.district,
    required this.commune,
    required this.village,
    required this.status,
    required this.waterSupplyCode,
    required this.user,
    required this.mapUnitId,
    required this.decimalDegreeLat,
    required this.decimalDegreeLng,
    required this.utmX,
    required this.utmY,
    required this.mdsXDegree,
    required this.mdsXMinute,
    required this.mdsXSecond,
    required this.mdsYDegree,
    required this.mdsYMinute,
    required this.mdsYSecond,
    required this.totalFamily,
    required this.beneficiaryTotalFamily,
    required this.beneficiaryTotalFamilyIndigenous,
    required this.beneficiaryTotalFamilyPoor1,
    required this.beneficiaryTotalFamilyPoor2,
    required this.beneficiaryTotalFamilyVulnearable,
    required this.beneficiaryTotalPeople,
    required this.beneficiaryTotalWoman,
    required this.constructedBy,
    required this.constructionDate,
    required this.isRiskEnviromentArea,
    required this.managedBy,
    required this.managementType,
    required this.sourceBudget,
    required this.waterSupplyTypeId,
    required this.isWaterQualityCheck,
    this.waterSupplyWells,
    this.waterSupplyPipes,
    this.watersupplykiosks,
    this.waterSupplyPipe,
    // this.waterSupplyKiosk,
     this.waterSupplyCommunityPond,
    this.waterSupplyRainWaterHarvesting,
    // this.waterSupplyPipePrivate,
    this.waterSupplyAirWater,
    this.workflows,
    this.qrcode,
    this.wqcParam1,
    this.wqcParam2,
    this.wqcParam3,
    this.wqcParam4,
    this.wqcParam5,
    this.wqcParam10,
    this.wqcParam11,
    this.wqcParam12,
    this.wqcParam13,
    this.wqcParam14,
    this.wqcParam15,
    this.wqcParam16,
    this.wqcParam6,
    this.wqcParam7,
    this.wqcParam8,
    this.wqcParam9,
    //required this.workflow
  });

  @JsonKey(name: 'id')
  int id;
  // @JsonKey(name: 'created_by')
  // String createdBy;
  @JsonKey(name: 'created_date')
  DateTime createdDate;
  @JsonKey(name:'water_supply_type_id')
  int waterSupplyTypeId;
  @JsonKey(name: 'water_supply_type')
  String waterSupplyType;
  @JsonKey(name: 'province_id')
  ProvinceModel address;
  @JsonKey(name: 'district_id')
  DistrictModel district;
  @JsonKey(name: 'commune_id')
  CommuneModel commune;
  @JsonKey(name: 'village_id')
  VillageModel village;
  @JsonKey(name : 'main_status')
  StatusModel status;
  @JsonKey(name : 'water_supply_code')
  String waterSupplyCode;
  @JsonKey(name:'created_by')
  UserModel user;

  @JsonKey(name:'map_unit')
  int mapUnitId;
  @JsonKey(name:'decimal_degress_lat')
  String decimalDegreeLat; 
  @JsonKey(name:'decimal_degress_lng')
  String decimalDegreeLng;
  @JsonKey(name:'utm_x')
  String utmX;
  @JsonKey(name:'utm_y')
  String utmY;
  @JsonKey(name:'mds_x_degress')
  String mdsXDegree;
  @JsonKey(name: 'mds_x_minute')
  String mdsXMinute;
  @JsonKey(name:'mds_x_second')
  String mdsXSecond;
  @JsonKey(name:'mds_y_degree')
  String mdsYDegree;
  @JsonKey(name:'mds_y_minute')
  String mdsYMinute;
  @JsonKey(name:'mds_y_second')
  String mdsYSecond;

  @JsonKey(name: 'total_family')
  int totalFamily;
  @JsonKey(name:'is_risk_enviroment_area')
  bool isRiskEnviromentArea;
  @JsonKey(name:'construction_date')
  String constructionDate;
  @JsonKey(name:'source_budget')
  int sourceBudget;
  @JsonKey(name:'constructed_by')
  String constructedBy;
  @JsonKey(name:'management_type')
  int managementType;
  @JsonKey(name:'managed_by')
  String managedBy;
  @JsonKey(name: 'beneficiary_total_people')
  int beneficiaryTotalPeople;
   @JsonKey(name: 'beneficiary_total_women')
  int beneficiaryTotalWoman;
   @JsonKey(name: 'beneficiary_total_family')
  int beneficiaryTotalFamily;
   @JsonKey(name: 'beneficiary_total_family_poor_1')
  int beneficiaryTotalFamilyPoor1;
   @JsonKey(name: 'beneficiary_total_family_poor_2')
  int beneficiaryTotalFamilyPoor2;
   @JsonKey(name: 'beneficiary_total_family_vulnerable')
  int beneficiaryTotalFamilyVulnearable;
   @JsonKey(name: 'beneficiary_total_family_indigenous')
  int beneficiaryTotalFamilyIndigenous;
  @JsonKey(name:'is_water_quality_check')
  bool isWaterQualityCheck;
  // @JsonKey(name:'watersupplyworkflow_watersupply')
  // List<MyApprovalHistoryModel> workflow;
  @JsonKey(name:'watersupplyworkflow_watersupply')
  List<WaterSupplyWorkFlowModel>? workflows;
  @JsonKey(name:'watersupplyqrcode_watersupply')
  List<WaterSupplyQRCodeModel>? qrcode;

  @JsonKey(name:'watersupplywell_watersupply')
  List<WaterSupplyWellModel>? waterSupplyWells;
  @JsonKey(name:'watersupplypipe_watersupply')
  List<WaterSupplySmallPipeModel>? waterSupplyPipes;
  @JsonKey(name:'watersupplyKiosk_watersupply')
  List<WaterSupplyKioskModel>? watersupplykiosks;
  @JsonKey(name:'watersupplyCommunityPond_watersupply')
  List<WaterSupplyPondModel>? waterSupplyCommunityPond;
  @JsonKey(name:'watersupplyRainWaterHarvesting_watersupply')
  List<WaterSupplyRainModel>? waterSupplyRainWaterHarvesting;
  @JsonKey(name:'watersupplypipeprivate_watersupply')
  List<WaterSupplyPipeModel>? waterSupplyPipe;
  @JsonKey(name:'watersupplyairwater_watersupply')
  List<WaterSupplyAirModel>? waterSupplyAirWater;
  // @JsonKey(name:'watersupplyKiosk_watersupply')
  // List<WaterSupplyWellModel>? waterSupplyKiosk;
  // @JsonKey(name:'watersupplyCommunityPond_watersupply')
  // List<WaterSupplyWellModel>? waterSupplyCommunityPond;
  // @JsonKey(name:'watersupplyRainWaterHarvesting_watersupply')
  // List<WaterSupplyWellModel>? waterSupplyRainWaterHarvesting;
  // @JsonKey(name:'watersupplypipeprivate_watersupply')
  // List<WaterSupplyWellModel>? waterSupplyPipePrivate;
  // @JsonKey(name:'watersupplyairwater_watersupply')
  // List<WaterSupplyWellModel>? waterSupplyAirWater;

  @JsonKey(name: 'wqc_param1_obj')
  List<WaterSupplyWaterQualityParameterModel>? wqcParam1;
  @JsonKey(name: 'wqc_param2_obj')
  List<WaterSupplyWaterQualityParameterModel>? wqcParam2;
  @JsonKey(name: 'wqc_param3_obj')
  List<WaterSupplyWaterQualityParameterModel>? wqcParam3;
  @JsonKey(name: 'wqc_param4_obj')
  List<WaterSupplyWaterQualityParameterModel>? wqcParam4;
  @JsonKey(name: 'wqc_param5_obj')
  List<WaterSupplyWaterQualityParameterModel>? wqcParam5;
  @JsonKey(name: 'wqc_param6_obj')
  List<WaterSupplyWaterQualityParameterModel>? wqcParam6;
  @JsonKey(name: 'wqc_param7_obj')
  List<WaterSupplyWaterQualityParameterModel>? wqcParam7;
  @JsonKey(name: 'wqc_param8_obj')
  List<WaterSupplyWaterQualityParameterModel>? wqcParam8;
  @JsonKey(name: 'wqc_param9_obj')
  List<WaterSupplyWaterQualityParameterModel>? wqcParam9;
  @JsonKey(name: 'wqc_param10_obj')
  List<WaterSupplyWaterQualityParameterModel>? wqcParam10;
  @JsonKey(name: 'wqc_param11_obj')
  List<WaterSupplyWaterQualityParameterModel>? wqcParam11;
  @JsonKey(name: 'wqc_param12_obj')
  List<WaterSupplyWaterQualityParameterModel>? wqcParam12;
  @JsonKey(name: 'wqc_param13_obj')
  List<WaterSupplyWaterQualityParameterModel>? wqcParam13;
  @JsonKey(name: 'wqc_param14_obj')
  List<WaterSupplyWaterQualityParameterModel>? wqcParam14;
  @JsonKey(name: 'wqc_param15_obj')
  List<WaterSupplyWaterQualityParameterModel>? wqcParam15;
  @JsonKey(name: 'wqc_param16_obj')
  List<WaterSupplyWaterQualityParameterModel>? wqcParam16;


  factory WaterSupplyModel.fromJson(Map<String, dynamic> json) =>
      _$WaterSupplyModelFromJson(json);

  Map<String, dynamic> toJson() => _$WaterSupplyModelToJson(this);
}
