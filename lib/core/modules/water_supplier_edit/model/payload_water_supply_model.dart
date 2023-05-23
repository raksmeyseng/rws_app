import 'package:json_annotation/json_annotation.dart';

part 'payload_water_supply_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PayloadWaterSupplyModel {
  PayloadWaterSupplyModel({
    required this.createdBy,
    required this.province,
    required this.district,
    required this.commune,
    required this.village,
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
  });

  @JsonKey(name: 'created_by')
  String createdBy;
  @JsonKey(name: 'water_supply_type_id')
  int waterSupplyTypeId;
  @JsonKey(name: 'province_id')
  int province;
  @JsonKey(name: 'district_id')
  int district;
  @JsonKey(name: 'commune_id')
  int commune;
  @JsonKey(name: 'village_id')
  int village;
  @JsonKey(name: 'map_unit')
  int mapUnitId;
  @JsonKey(name: 'decimal_degress_lat')
  String decimalDegreeLat;
  @JsonKey(name: 'decimal_degress_lng')
  String decimalDegreeLng;
  @JsonKey(name: 'utm_x')
  String utmX;
  @JsonKey(name: 'utm_y')
  String utmY;
  @JsonKey(name: 'mds_x_degress')
  String mdsXDegree;
  @JsonKey(name: 'mds_x_minute')
  String mdsXMinute;
  @JsonKey(name: 'mds_x_second')
  String mdsXSecond;
  @JsonKey(name: 'mds_y_degree')
  String mdsYDegree;
  @JsonKey(name: 'mds_y_minute')
  String mdsYMinute;
  @JsonKey(name: 'mds_y_second')
  String mdsYSecond;
  @JsonKey(name: 'total_family')
  int totalFamily;
  @JsonKey(name: 'is_risk_enviroment_area')
  bool isRiskEnviromentArea;
  @JsonKey(name: 'construction_date')
  DateTime constructionDate;
  @JsonKey(name: 'source_budget')
  int sourceBudget;
  @JsonKey(name: 'constructed_by')
  String constructedBy;
  @JsonKey(name: 'management_type')
  int managementType;
  @JsonKey(name: 'managed_by')
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

  factory PayloadWaterSupplyModel.fromJson(Map<String, dynamic> json) =>
      _$PayloadWaterSupplyModelFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadWaterSupplyModelToJson(this);
}
