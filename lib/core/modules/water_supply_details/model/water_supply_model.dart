import 'package:json_annotation/json_annotation.dart';
import 'package:rws_app/core/modules/my_draft/models/my_draft_model.dart';

part 'water_supply_model.g.dart';

@JsonSerializable(explicitToJson: true)
class WaterSupplyModel {

  //WaterSupplyModel();

  WaterSupplyModel({
    required this.id,
    required this.createdBy,
    required this.createdDate,
    required this.waterSupplyType,
    required this.address,
    required this.district,
    required this.commune,
    required this.village,
    required this.status,
    required this.waterSupplyCode
  });

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'created_by')
  String createdBy;
  @JsonKey(name: 'created_date')
  DateTime createdDate;
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

  factory WaterSupplyModel.fromJson(Map<String, dynamic> json) =>
      _$WaterSupplyModelFromJson(json);

  Map<String, dynamic> toJson() => _$WaterSupplyModelToJson(this);
}

