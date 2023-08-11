part of 'water_supply_list_model.dart';

WaterSupplyListModel _$WaterSupplyListModelFromJson(Map<String, dynamic> json)=>
WaterSupplyListModel(
  id: json['id'] as int,
      createdDate: DateTime.parse(json['created_at'] as String),
      waterSupplyType: json['water_supply_type_id']['name_kh'] as String,
      address:
          ProvinceModel.fromJson(json['province_id'] as Map<String, dynamic>),
      district:
          DistrictModel.fromJson(json['district_id'] as Map<String, dynamic>),
      commune:
          CommuneModel.fromJson(json['commune_id'] as Map<String, dynamic>),
      village: json['village_id']==null?null:
          VillageModel.fromJson(json['village_id']),
      status: StatusModel.fromJson(json['main_status'] as Map<String, dynamic>),
      waterSupplyCode: json['water_supply_code'] as String,
      user: UserModel.fromJson(json['created_by'] as Map<String, dynamic>),
      waterSupplyTypeId: json['water_supply_type_id']['id'] as int,
      );