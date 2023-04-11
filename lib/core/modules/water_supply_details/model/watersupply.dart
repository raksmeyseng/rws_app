// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    required this.id,
    required this.waterSupplyTypeId,
    required this.provinceId,
    required this.districtId,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.cratedAt1,
    this.updatedAt,
    required this.communeId,
    required this.villageId,
    required this.waterSupplyCode,
    required this.totalFamily,
    required this.utmX,
    required this.utmY,
    required this.isRiskEnviromentArea,
    required this.constructionDate,
    required this.sourceBudget,
    required this.constructedBy,
    required this.managementType,
    required this.managedBy,
    required this.beneficiaryTotalPeople,
    required this.beneficiaryTotalWomen,
    required this.beneficiaryTotalFamily,
    required this.beneficiaryTotalFamilyPoor1,
    required this.beneficiaryTotalFamilyPoor2,
    required this.beneficiaryTotalFamilyVulnerable,
    required this.beneficiaryTotalFamilyIndigenous,
    required this.watersupplywellWatersupply,
    required this.watersupplypipeWatersupply,
    required this.watersupplyKioskWatersupply,
    required this.watersupplyCommunityPondWatersupply,
    required this.watersupplyRainWaterHarvestingWatersupply,
    required this.watersupplypipeprivateWatersupply,
    required this.watersupplyairwaterWatersupply,
    required this.watersupplyworkflowWatersupply,
    required this.mainStatus,
    required this.watersupplyqrcodeWatersupply,
    required this.wqcParam1Obj,
    required this.wqcParam2Obj,
    required this.wqcParam3Obj,
    required this.wqcParam4Obj,
    required this.wqcParam5Obj,
    required this.wqcParam6Obj,
    required this.wqcParam7Obj,
    required this.wqcParam8Obj,
    required this.wqcParam9Obj,
    required this.wqcParam10Obj,
    required this.wqcParam11Obj,
    required this.wqcParam12Obj,
    required this.wqcParam13Obj,
    required this.wqcParam14Obj,
    required this.wqcParam15Obj,
    required this.wqcParam16Obj,
    required this.isWaterQualityCheck,
    required this.mapUnit,
    required this.decimalDegressLat,
    required this.decimalDegressLng,
    required this.mdsXDegress,
    required this.mdsXMinute,
    required this.mdsXSecond,
    required this.mdsYDegress,
    required this.mdsYMinute,
    required this.mdsYSecond,
  });

  int id;
  WaterSupplyTypeId waterSupplyTypeId;
  Id provinceId;
  Id districtId;
  CreatedBy createdBy;
  CreatedBy updatedBy;
  DateTime createdAt;
  DateTime cratedAt1;
  dynamic updatedAt;
  Id communeId;
  Id villageId;
  String waterSupplyCode;
  int totalFamily;
  String utmX;
  String utmY;
  bool isRiskEnviromentArea;
  DateTime constructionDate;
  int sourceBudget;
  String constructedBy;
  int managementType;
  String managedBy;
  int beneficiaryTotalPeople;
  int beneficiaryTotalWomen;
  int beneficiaryTotalFamily;
  int beneficiaryTotalFamilyPoor1;
  int beneficiaryTotalFamilyPoor2;
  int beneficiaryTotalFamilyVulnerable;
  int beneficiaryTotalFamilyIndigenous;
  List<WatersupplywellWatersupply> watersupplywellWatersupply;
  List<dynamic> watersupplypipeWatersupply;
  List<dynamic> watersupplyKioskWatersupply;
  List<dynamic> watersupplyCommunityPondWatersupply;
  List<dynamic> watersupplyRainWaterHarvestingWatersupply;
  List<dynamic> watersupplypipeprivateWatersupply;
  List<WatersupplyairwaterWatersupply> watersupplyairwaterWatersupply;
  List<WatersupplyworkflowWatersupply> watersupplyworkflowWatersupply;
  MainStatus mainStatus;
  List<WatersupplyqrcodeWatersupply> watersupplyqrcodeWatersupply;
  List<WqcParamObj> wqcParam1Obj;
  List<WqcParamObj> wqcParam2Obj;
  List<WqcParamObj> wqcParam3Obj;
  List<WqcParamObj> wqcParam4Obj;
  List<WqcParamObj> wqcParam5Obj;
  List<WqcParamObj> wqcParam6Obj;
  List<WqcParamObj> wqcParam7Obj;
  List<WqcParamObj> wqcParam8Obj;
  List<WqcParamObj> wqcParam9Obj;
  List<WqcParamObj> wqcParam10Obj;
  List<WqcParamObj> wqcParam11Obj;
  List<WqcParamObj> wqcParam12Obj;
  List<WqcParamObj> wqcParam13Obj;
  List<WqcParamObj> wqcParam14Obj;
  List<WqcParamObj> wqcParam15Obj;
  List<WqcParamObj> wqcParam16Obj;
  bool isWaterQualityCheck;
  int mapUnit;
  String decimalDegressLat;
  String decimalDegressLng;
  String mdsXDegress;
  String mdsXMinute;
  String mdsXSecond;
  String mdsYDegress;
  String mdsYMinute;
  String mdsYSecond;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    id: json["id"],
    waterSupplyTypeId: WaterSupplyTypeId.fromJson(json["water_supply_type_id"]),
    provinceId: Id.fromJson(json["province_id"]),
    districtId: Id.fromJson(json["district_id"]),
    createdBy: CreatedBy.fromJson(json["created_by"]),
    updatedBy: CreatedBy.fromJson(json["updated_by"]),
    createdAt: DateTime.parse(json["created_at"]),
    cratedAt1: DateTime.parse(json["crated_at_1"]),
    updatedAt: json["updated_at"],
    communeId: Id.fromJson(json["commune_id"]),
    villageId: Id.fromJson(json["village_id"]),
    waterSupplyCode: json["water_supply_code"],
    totalFamily: json["total_family"],
    utmX: json["utm_x"],
    utmY: json["utm_y"],
    isRiskEnviromentArea: json["is_risk_enviroment_area"],
    constructionDate: DateTime.parse(json["construction_date"]),
    sourceBudget: json["source_budget"],
    constructedBy: json["constructed_by"],
    managementType: json["management_type"],
    managedBy: json["managed_by"],
    beneficiaryTotalPeople: json["beneficiary_total_people"],
    beneficiaryTotalWomen: json["beneficiary_total_women"],
    beneficiaryTotalFamily: json["beneficiary_total_family"],
    beneficiaryTotalFamilyPoor1: json["beneficiary_total_family_poor_1"],
    beneficiaryTotalFamilyPoor2: json["beneficiary_total_family_poor_2"],
    beneficiaryTotalFamilyVulnerable: json["beneficiary_total_family_vulnerable"],
    beneficiaryTotalFamilyIndigenous: json["beneficiary_total_family_indigenous"],
    watersupplywellWatersupply: List<WatersupplywellWatersupply>.from(json["watersupplywell_watersupply"].map((x) => WatersupplywellWatersupply.fromJson(x))),
    watersupplypipeWatersupply: List<dynamic>.from(json["watersupplypipe_watersupply"].map((x) => x)),
    watersupplyKioskWatersupply: List<dynamic>.from(json["watersupplyKiosk_watersupply"].map((x) => x)),
    watersupplyCommunityPondWatersupply: List<dynamic>.from(json["watersupplyCommunityPond_watersupply"].map((x) => x)),
    watersupplyRainWaterHarvestingWatersupply: List<dynamic>.from(json["watersupplyRainWaterHarvesting_watersupply"].map((x) => x)),
    watersupplypipeprivateWatersupply: List<dynamic>.from(json["watersupplypipeprivate_watersupply"].map((x) => x)),
    watersupplyairwaterWatersupply: List<WatersupplyairwaterWatersupply>.from(json["watersupplyairwater_watersupply"].map((x) => WatersupplyairwaterWatersupply.fromJson(x))),
    watersupplyworkflowWatersupply: List<WatersupplyworkflowWatersupply>.from(json["watersupplyworkflow_watersupply"].map((x) => WatersupplyworkflowWatersupply.fromJson(x))),
    mainStatus: MainStatus.fromJson(json["main_status"]),
    watersupplyqrcodeWatersupply: List<WatersupplyqrcodeWatersupply>.from(json["watersupplyqrcode_watersupply"].map((x) => WatersupplyqrcodeWatersupply.fromJson(x))),
    wqcParam1Obj: List<WqcParamObj>.from(json["wqc_param1_obj"].map((x) => WqcParamObj.fromJson(x))),
    wqcParam2Obj: List<WqcParamObj>.from(json["wqc_param2_obj"].map((x) => WqcParamObj.fromJson(x))),
    wqcParam3Obj: List<WqcParamObj>.from(json["wqc_param3_obj"].map((x) => WqcParamObj.fromJson(x))),
    wqcParam4Obj: List<WqcParamObj>.from(json["wqc_param4_obj"].map((x) => WqcParamObj.fromJson(x))),
    wqcParam5Obj: List<WqcParamObj>.from(json["wqc_param5_obj"].map((x) => WqcParamObj.fromJson(x))),
    wqcParam6Obj: List<WqcParamObj>.from(json["wqc_param6_obj"].map((x) => WqcParamObj.fromJson(x))),
    wqcParam7Obj: List<WqcParamObj>.from(json["wqc_param7_obj"].map((x) => WqcParamObj.fromJson(x))),
    wqcParam8Obj: List<WqcParamObj>.from(json["wqc_param8_obj"].map((x) => WqcParamObj.fromJson(x))),
    wqcParam9Obj: List<WqcParamObj>.from(json["wqc_param9_obj"].map((x) => WqcParamObj.fromJson(x))),
    wqcParam10Obj: List<WqcParamObj>.from(json["wqc_param10_obj"].map((x) => WqcParamObj.fromJson(x))),
    wqcParam11Obj: List<WqcParamObj>.from(json["wqc_param11_obj"].map((x) => WqcParamObj.fromJson(x))),
    wqcParam12Obj: List<WqcParamObj>.from(json["wqc_param12_obj"].map((x) => WqcParamObj.fromJson(x))),
    wqcParam13Obj: List<WqcParamObj>.from(json["wqc_param13_obj"].map((x) => WqcParamObj.fromJson(x))),
    wqcParam14Obj: List<WqcParamObj>.from(json["wqc_param14_obj"].map((x) => WqcParamObj.fromJson(x))),
    wqcParam15Obj: List<WqcParamObj>.from(json["wqc_param15_obj"].map((x) => WqcParamObj.fromJson(x))),
    wqcParam16Obj: List<WqcParamObj>.from(json["wqc_param16_obj"].map((x) => WqcParamObj.fromJson(x))),
    isWaterQualityCheck: json["is_water_quality_check"],
    mapUnit: json["map_unit"],
    decimalDegressLat: json["decimal_degress_lat"],
    decimalDegressLng: json["decimal_degress_lng"],
    mdsXDegress: json["mds_x_degress"],
    mdsXMinute: json["mds_x_minute"],
    mdsXSecond: json["mds_x_second"],
    mdsYDegress: json["mds_y_degress"],
    mdsYMinute: json["mds_y_minute"],
    mdsYSecond: json["mds_y_second"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "water_supply_type_id": waterSupplyTypeId.toJson(),
    "province_id": provinceId.toJson(),
    "district_id": districtId.toJson(),
    "created_by": createdBy.toJson(),
    "updated_by": updatedBy.toJson(),
    "created_at": createdAt.toIso8601String(),
    "crated_at_1": cratedAt1.toIso8601String(),
    "updated_at": updatedAt,
    "commune_id": communeId.toJson(),
    "village_id": villageId.toJson(),
    "water_supply_code": waterSupplyCode,
    "total_family": totalFamily,
    "utm_x": utmX,
    "utm_y": utmY,
    "is_risk_enviroment_area": isRiskEnviromentArea,
    "construction_date": "${constructionDate.year.toString().padLeft(4, '0')}-${constructionDate.month.toString().padLeft(2, '0')}-${constructionDate.day.toString().padLeft(2, '0')}",
    "source_budget": sourceBudget,
    "constructed_by": constructedBy,
    "management_type": managementType,
    "managed_by": managedBy,
    "beneficiary_total_people": beneficiaryTotalPeople,
    "beneficiary_total_women": beneficiaryTotalWomen,
    "beneficiary_total_family": beneficiaryTotalFamily,
    "beneficiary_total_family_poor_1": beneficiaryTotalFamilyPoor1,
    "beneficiary_total_family_poor_2": beneficiaryTotalFamilyPoor2,
    "beneficiary_total_family_vulnerable": beneficiaryTotalFamilyVulnerable,
    "beneficiary_total_family_indigenous": beneficiaryTotalFamilyIndigenous,
    "watersupplywell_watersupply": List<dynamic>.from(watersupplywellWatersupply.map((x) => x.toJson())),
    "watersupplypipe_watersupply": List<dynamic>.from(watersupplypipeWatersupply.map((x) => x)),
    "watersupplyKiosk_watersupply": List<dynamic>.from(watersupplyKioskWatersupply.map((x) => x)),
    "watersupplyCommunityPond_watersupply": List<dynamic>.from(watersupplyCommunityPondWatersupply.map((x) => x)),
    "watersupplyRainWaterHarvesting_watersupply": List<dynamic>.from(watersupplyRainWaterHarvestingWatersupply.map((x) => x)),
    "watersupplypipeprivate_watersupply": List<dynamic>.from(watersupplypipeprivateWatersupply.map((x) => x)),
    "watersupplyairwater_watersupply": List<dynamic>.from(watersupplyairwaterWatersupply.map((x) => x.toJson())),
    "watersupplyworkflow_watersupply": List<dynamic>.from(watersupplyworkflowWatersupply.map((x) => x.toJson())),
    "main_status": mainStatus.toJson(),
    "watersupplyqrcode_watersupply": List<dynamic>.from(watersupplyqrcodeWatersupply.map((x) => x.toJson())),
    "wqc_param1_obj": List<dynamic>.from(wqcParam1Obj.map((x) => x.toJson())),
    "wqc_param2_obj": List<dynamic>.from(wqcParam2Obj.map((x) => x.toJson())),
    "wqc_param3_obj": List<dynamic>.from(wqcParam3Obj.map((x) => x.toJson())),
    "wqc_param4_obj": List<dynamic>.from(wqcParam4Obj.map((x) => x.toJson())),
    "wqc_param5_obj": List<dynamic>.from(wqcParam5Obj.map((x) => x.toJson())),
    "wqc_param6_obj": List<dynamic>.from(wqcParam6Obj.map((x) => x.toJson())),
    "wqc_param7_obj": List<dynamic>.from(wqcParam7Obj.map((x) => x.toJson())),
    "wqc_param8_obj": List<dynamic>.from(wqcParam8Obj.map((x) => x.toJson())),
    "wqc_param9_obj": List<dynamic>.from(wqcParam9Obj.map((x) => x.toJson())),
    "wqc_param10_obj": List<dynamic>.from(wqcParam10Obj.map((x) => x.toJson())),
    "wqc_param11_obj": List<dynamic>.from(wqcParam11Obj.map((x) => x.toJson())),
    "wqc_param12_obj": List<dynamic>.from(wqcParam12Obj.map((x) => x.toJson())),
    "wqc_param13_obj": List<dynamic>.from(wqcParam13Obj.map((x) => x.toJson())),
    "wqc_param14_obj": List<dynamic>.from(wqcParam14Obj.map((x) => x.toJson())),
    "wqc_param15_obj": List<dynamic>.from(wqcParam15Obj.map((x) => x.toJson())),
    "wqc_param16_obj": List<dynamic>.from(wqcParam16Obj.map((x) => x.toJson())),
    "is_water_quality_check": isWaterQualityCheck,
    "map_unit": mapUnit,
    "decimal_degress_lat": decimalDegressLat,
    "decimal_degress_lng": decimalDegressLng,
    "mds_x_degress": mdsXDegress,
    "mds_x_minute": mdsXMinute,
    "mds_x_second": mdsXSecond,
    "mds_y_degress": mdsYDegress,
    "mds_y_minute": mdsYMinute,
    "mds_y_second": mdsYSecond,
  };
}

class Id {
  Id({
    required this.id,
    required this.codeEn,
    required this.codeKh,
    required this.nameEn,
    required this.nameKh,
    this.description,
    required this.isActive,
    required this.totalPopulation,
    this.districtId,
    this.provinceId,
    this.communeId,
  });

  int id;
  String codeEn;
  String codeKh;
  String nameEn;
  String nameKh;
  String? description;
  bool isActive;
  String totalPopulation;
  int? districtId;
  int? provinceId;
  int? communeId;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
    id: json["id"],
    codeEn: json["code_en"],
    codeKh: json["code_kh"],
    nameEn: json["name_en"],
    nameKh: json["name_kh"],
    description: json["description"],
    isActive: json["is_active"],
    totalPopulation: json["total_population"],
    districtId: json["district_id"],
    provinceId: json["province_id"],
    communeId: json["commune_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code_en": codeEn,
    "code_kh": codeKh,
    "name_en": nameEn,
    "name_kh": nameKh,
    "description": description,
    "is_active": isActive,
    "total_population": totalPopulation,
    "district_id": districtId,
    "province_id": provinceId,
    "commune_id": communeId,
  };
}

class CreatedBy {
  CreatedBy({
    required this.id,
    required this.username,
    required this.email,
    required this.isDataEntry,
    required this.isHeadDepartment,
    required this.isProvincialDepartmentHead,
    required this.isDataVerifier1,
    required this.isDataVerifier2,
    required this.isPartner,
    this.dataEntryProvinceId,
    this.provincialDepartmentHeadProvinceId,
    required this.firstName,
    required this.lastName,
    required this.isStaff,
  });

  int id;
  String username;
  String email;
  bool isDataEntry;
  bool isHeadDepartment;
  bool isProvincialDepartmentHead;
  bool isDataVerifier1;
  bool isDataVerifier2;
  bool isPartner;
  int? dataEntryProvinceId;
  int? provincialDepartmentHeadProvinceId;
  String firstName;
  String lastName;
  bool isStaff;

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    isDataEntry: json["is_data_entry"],
    isHeadDepartment: json["is_head_department"],
    isProvincialDepartmentHead: json["is_provincial_department_head"],
    isDataVerifier1: json["is_data_verifier_1"],
    isDataVerifier2: json["is_data_verifier_2"],
    isPartner: json["is_partner"],
    dataEntryProvinceId: json["data_entry_province_id"],
    provincialDepartmentHeadProvinceId: json["provincial_department_head_province_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    isStaff: json["is_staff"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "is_data_entry": isDataEntry,
    "is_head_department": isHeadDepartment,
    "is_provincial_department_head": isProvincialDepartmentHead,
    "is_data_verifier_1": isDataVerifier1,
    "is_data_verifier_2": isDataVerifier2,
    "is_partner": isPartner,
    "data_entry_province_id": dataEntryProvinceId,
    "provincial_department_head_province_id": provincialDepartmentHeadProvinceId,
    "first_name": firstName,
    "last_name": lastName,
    "is_staff": isStaff,
  };
}

class MainStatus {
  MainStatus({
    required this.id,
    required this.statusName,
    required this.statusNameKh,
    required this.isActive,
  });

  int id;
  String statusName;
  String statusNameKh;
  bool isActive;

  factory MainStatus.fromJson(Map<String, dynamic> json) => MainStatus(
    id: json["id"],
    statusName: json["status_name"],
    statusNameKh: json["status_name_kh"],
    isActive: json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status_name": statusName,
    "status_name_kh": statusNameKh,
    "is_active": isActive,
  };
}

class WaterSupplyTypeId {
  WaterSupplyTypeId({
    required this.id,
    required this.code,
    required this.nameEn,
    required this.nameKh,
    this.description,
    required this.isActive,
    this.waterSupplyOptionId,
  });

  int id;
  String code;
  String nameEn;
  String nameKh;
  dynamic description;
  bool isActive;
  int? waterSupplyOptionId;

  factory WaterSupplyTypeId.fromJson(Map<String, dynamic> json) => WaterSupplyTypeId(
    id: json["id"],
    code: json["code"],
    nameEn: json["name_en"],
    nameKh: json["name_kh"],
    description: json["description"],
    isActive: json["is_active"],
    waterSupplyOptionId: json["water_supply_option_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name_en": nameEn,
    "name_kh": nameKh,
    "description": description,
    "is_active": isActive,
    "water_supply_option_id": waterSupplyOptionId,
  };
}

class WatersupplyairwaterWatersupply {
  WatersupplyairwaterWatersupply({
    required this.id,
    required this.watersupplyId,
    required this.isActive,
    required this.sourceTypeOfWater,
    required this.abiltyOfProduceWater,
    required this.filterSystem,
    required this.waterQualityChecking,
    required this.status,
    required this.statusNoReason,
    required this.filterSystemObj,
    required this.statusObj,
    required this.waterQualityCheckingObj,
    required this.watersupplyairwateroptionvalueWatersupplykioskwater,
  });

  int id;
  int watersupplyId;
  bool isActive;
  String sourceTypeOfWater;
  String abiltyOfProduceWater;
  String filterSystem;
  String waterQualityChecking;
  String status;
  String statusNoReason;
  List<WaterSupplyTypeId> filterSystemObj;
  List<WaterSupplyTypeId> statusObj;
  List<WaterSupplyTypeId> waterQualityCheckingObj;
  List<WatersupplyairwateroptionvalueWatersupplykioskwater> watersupplyairwateroptionvalueWatersupplykioskwater;

  factory WatersupplyairwaterWatersupply.fromJson(Map<String, dynamic> json) => WatersupplyairwaterWatersupply(
    id: json["id"],
    watersupplyId: json["watersupply_id"],
    isActive: json["is_active"],
    sourceTypeOfWater: json["source_type_of_water"],
    abiltyOfProduceWater: json["abilty_of_produce_water"],
    filterSystem: json["filter_system"],
    waterQualityChecking: json["water_quality_checking"],
    status: json["status"],
    statusNoReason: json["status_no_reason"],
    filterSystemObj: List<WaterSupplyTypeId>.from(json["filter_system_obj"].map((x) => WaterSupplyTypeId.fromJson(x))),
    statusObj: List<WaterSupplyTypeId>.from(json["status_obj"].map((x) => WaterSupplyTypeId.fromJson(x))),
    waterQualityCheckingObj: List<WaterSupplyTypeId>.from(json["water_quality_checking_obj"].map((x) => WaterSupplyTypeId.fromJson(x))),
    watersupplyairwateroptionvalueWatersupplykioskwater: List<WatersupplyairwateroptionvalueWatersupplykioskwater>.from(json["watersupplyairwateroptionvalue_watersupplykioskwater"].map((x) => WatersupplyairwateroptionvalueWatersupplykioskwater.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "watersupply_id": watersupplyId,
    "is_active": isActive,
    "source_type_of_water": sourceTypeOfWater,
    "abilty_of_produce_water": abiltyOfProduceWater,
    "filter_system": filterSystem,
    "water_quality_checking": waterQualityChecking,
    "status": status,
    "status_no_reason": statusNoReason,
    "filter_system_obj": List<dynamic>.from(filterSystemObj.map((x) => x.toJson())),
    "status_obj": List<dynamic>.from(statusObj.map((x) => x.toJson())),
    "water_quality_checking_obj": List<dynamic>.from(waterQualityCheckingObj.map((x) => x.toJson())),
    "watersupplyairwateroptionvalue_watersupplykioskwater": List<dynamic>.from(watersupplyairwateroptionvalueWatersupplykioskwater.map((x) => x.toJson())),
  };
}

class WatersupplyairwateroptionvalueWatersupplykioskwater {
  WatersupplyairwateroptionvalueWatersupplykioskwater({
    required this.id,
    this.waterSupplyAirwaterId,
    required this.optionId,
    required this.valueId,
    required this.isActive,
    required this.valueObj,
    this.waterSupplyWellId,
  });

  int id;
  int? waterSupplyAirwaterId;
  int optionId;
  int valueId;
  bool isActive;
  List<WaterSupplyTypeId> valueObj;
  int? waterSupplyWellId;

  factory WatersupplyairwateroptionvalueWatersupplykioskwater.fromJson(Map<String, dynamic> json) => WatersupplyairwateroptionvalueWatersupplykioskwater(
    id: json["id"],
    waterSupplyAirwaterId: json["water_supply_airwater_id"],
    optionId: json["option_id"],
    valueId: json["value_id"],
    isActive: json["is_active"],
    valueObj: List<WaterSupplyTypeId>.from(json["value_obj"].map((x) => WaterSupplyTypeId.fromJson(x))),
    waterSupplyWellId: json["water_supply_well_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "water_supply_airwater_id": waterSupplyAirwaterId,
    "option_id": optionId,
    "value_id": valueId,
    "is_active": isActive,
    "value_obj": List<dynamic>.from(valueObj.map((x) => x.toJson())),
    "water_supply_well_id": waterSupplyWellId,
  };
}

class WatersupplyqrcodeWatersupply {
  WatersupplyqrcodeWatersupply({
    required this.id,
    required this.watersupplyId,
    required this.qrCodeImageName,
  });

  int id;
  int watersupplyId;
  String qrCodeImageName;

  factory WatersupplyqrcodeWatersupply.fromJson(Map<String, dynamic> json) => WatersupplyqrcodeWatersupply(
    id: json["id"],
    watersupplyId: json["watersupply_id"],
    qrCodeImageName: json["qr_code_image_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "watersupply_id": watersupplyId,
    "qr_code_image_name": qrCodeImageName,
  };
}

class WatersupplywellWatersupply {
  WatersupplywellWatersupply({
    required this.id,
    required this.watersupplyId,
    required this.wellType,
    required this.wellHeight,
    required this.wellFilterHeight,
    required this.wellWaterSupply,
    required this.wellNirostatic,
    required this.wellWatarQuality,
    required this.wellWaterQualityCheck,
    required this.wellStatus,
    required this.wellStatusReason,
    required this.isActive,
    required this.wellNirodynamic,
    required this.wellWatarQualityObj,
    required this.wellWaterQualityCheckObj,
    required this.wellStatusObj,
    required this.watersupplywelloptionvalueWatersupplywell,
    required this.wellTypeObj,
  });

  int id;
  int watersupplyId;
  String wellType;
  String wellHeight;
  String wellFilterHeight;
  String wellWaterSupply;
  String wellNirostatic;
  String wellWatarQuality;
  String wellWaterQualityCheck;
  String wellStatus;
  String wellStatusReason;
  bool isActive;
  String wellNirodynamic;
  List<WaterSupplyTypeId> wellWatarQualityObj;
  List<WaterSupplyTypeId> wellWaterQualityCheckObj;
  List<WaterSupplyTypeId> wellStatusObj;
  List<WatersupplyairwateroptionvalueWatersupplykioskwater> watersupplywelloptionvalueWatersupplywell;
  List<WatersupplyairwateroptionvalueWatersupplykioskwater> wellTypeObj;

  factory WatersupplywellWatersupply.fromJson(Map<String, dynamic> json) => WatersupplywellWatersupply(
    id: json["id"],
    watersupplyId: json["watersupply_id"],
    wellType: json["well_type"],
    wellHeight: json["well_height"],
    wellFilterHeight: json["well_filter_height"],
    wellWaterSupply: json["well_water_supply"],
    wellNirostatic: json["well_nirostatic"],
    wellWatarQuality: json["well_watar_quality"],
    wellWaterQualityCheck: json["well_water_quality_check"],
    wellStatus: json["well_status"],
    wellStatusReason: json["well_status_reason"],
    isActive: json["is_active"],
    wellNirodynamic: json["well_nirodynamic"],
    wellWatarQualityObj: List<WaterSupplyTypeId>.from(json["well_watar_quality_obj"].map((x) => WaterSupplyTypeId.fromJson(x))),
    wellWaterQualityCheckObj: List<WaterSupplyTypeId>.from(json["well_water_quality_check_obj"].map((x) => WaterSupplyTypeId.fromJson(x))),
    wellStatusObj: List<WaterSupplyTypeId>.from(json["well_status_obj"].map((x) => WaterSupplyTypeId.fromJson(x))),
    watersupplywelloptionvalueWatersupplywell: List<WatersupplyairwateroptionvalueWatersupplykioskwater>.from(json["watersupplywelloptionvalue_watersupplywell"].map((x) => WatersupplyairwateroptionvalueWatersupplykioskwater.fromJson(x))),
    wellTypeObj: List<WatersupplyairwateroptionvalueWatersupplykioskwater>.from(json["well_type_obj"].map((x) => WatersupplyairwateroptionvalueWatersupplykioskwater.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "watersupply_id": watersupplyId,
    "well_type": wellType,
    "well_height": wellHeight,
    "well_filter_height": wellFilterHeight,
    "well_water_supply": wellWaterSupply,
    "well_nirostatic": wellNirostatic,
    "well_watar_quality": wellWatarQuality,
    "well_water_quality_check": wellWaterQualityCheck,
    "well_status": wellStatus,
    "well_status_reason": wellStatusReason,
    "is_active": isActive,
    "well_nirodynamic": wellNirodynamic,
    "well_watar_quality_obj": List<dynamic>.from(wellWatarQualityObj.map((x) => x.toJson())),
    "well_water_quality_check_obj": List<dynamic>.from(wellWaterQualityCheckObj.map((x) => x.toJson())),
    "well_status_obj": List<dynamic>.from(wellStatusObj.map((x) => x.toJson())),
    "watersupplywelloptionvalue_watersupplywell": List<dynamic>.from(watersupplywelloptionvalueWatersupplywell.map((x) => x.toJson())),
    "well_type_obj": List<dynamic>.from(wellTypeObj.map((x) => x.toJson())),
  };
}

class WatersupplyworkflowWatersupply {
  WatersupplyworkflowWatersupply({
    required this.id,
    required this.watersupplyId,
    required this.statusId,
    required this.userId,
    required this.createdAt,
    required this.remark,
  });

  int id;
  int watersupplyId;
  MainStatus statusId;
  CreatedBy userId;
  DateTime createdAt;
  String remark;

  factory WatersupplyworkflowWatersupply.fromJson(Map<String, dynamic> json) => WatersupplyworkflowWatersupply(
    id: json["id"],
    watersupplyId: json["watersupply_id"],
    statusId: MainStatus.fromJson(json["status_id"]),
    userId: CreatedBy.fromJson(json["user_id"]),
    createdAt: DateTime.parse(json["created_at"]),
    remark: json["remark"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "watersupply_id": watersupplyId,
    "status_id": statusId.toJson(),
    "user_id": userId.toJson(),
    "created_at": createdAt.toIso8601String(),
    "remark": remark,
  };
}

class WqcParamObj {
  WqcParamObj({
    required this.id,
    required this.waterSupplyId,
    required this.waterQuanlityCheckParameterId,
    required this.value,
  });

  int id;
  int waterSupplyId;
  WaterQuanlityCheckParameterId waterQuanlityCheckParameterId;
  String value;

  factory WqcParamObj.fromJson(Map<String, dynamic> json) => WqcParamObj(
    id: json["id"],
    waterSupplyId: json["water_supply_id"],
    waterQuanlityCheckParameterId: WaterQuanlityCheckParameterId.fromJson(json["water_quanlity_check_parameter_id"]),
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "water_supply_id": waterSupplyId,
    "water_quanlity_check_parameter_id": waterQuanlityCheckParameterId.toJson(),
    "value": value,
  };
}

class WaterQuanlityCheckParameterId {
  WaterQuanlityCheckParameterId({
    required this.id,
    required this.parameterCode,
    required this.parameter,
    required this.unit,
    required this.standardOfDrinkingWater,
    required this.isActive,
    required this.fieldName,
  });

  int id;
  String parameterCode;
  String parameter;
  Unit unit;
  String standardOfDrinkingWater;
  bool isActive;
  String fieldName;

  factory WaterQuanlityCheckParameterId.fromJson(Map<String, dynamic> json) => WaterQuanlityCheckParameterId(
    id: json["id"],
    parameterCode: json["parameter_code"],
    parameter: json["parameter"],
    unit: unitValues.map[json["unit"]]!,
    standardOfDrinkingWater: json["standard_of_drinking_water"],
    isActive: json["is_active"],
    fieldName: json["field_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parameter_code": parameterCode,
    "parameter": parameter,
    "unit": unitValues.reverse[unit],
    "standard_of_drinking_water": standardOfDrinkingWater,
    "is_active": isActive,
    "field_name": fieldName,
  };
}

enum Unit { MG_L, N_A, NTU, CFU_OR_MPN_100_ML }

final unitValues = EnumValues({
  "CFU or MPN/100ml": Unit.CFU_OR_MPN_100_ML,
  "mg/l": Unit.MG_L,
  "NTU": Unit.NTU,
  "n/a": Unit.N_A
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
