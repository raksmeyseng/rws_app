import 'package:json_annotation/json_annotation.dart';

import '../../my_draft/models/my_draft_model.dart';

@JsonSerializable(explicitToJson: true)
class WaterSupplyMapModel{

  WaterSupplyMapModel({
    required this.id,
    required this.waterSupplyType,
    required this.address,
    required this.mapUnitId,
    required this.decimalDegreeLat,
    required this.decimalDegreeLng,
    required this.waterSupplyCode,
    required this.waterSupplyTypeId,
    required this.utmX,
    required this.utmY,
    required this.lat,
    required this.lng,
  });

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'water_supply_type')
  String waterSupplyType;
  @JsonKey(name: 'province_id')
  ProvinceModel address;
  @JsonKey(name : 'water_supply_code')
  String waterSupplyCode;
  @JsonKey(name:'map_unit')
  int mapUnitId;
  @JsonKey(name:'decimal_degress_lat')
  String decimalDegreeLat; 
  @JsonKey(name:'decimal_degress_lng')
  String decimalDegreeLng;
  @JsonKey(name:'water_supply_type_id')
  int waterSupplyTypeId;
  @JsonKey(name:'utm_x')
  String utmX;
  @JsonKey(name:'utm_y')
  String utmY;
  @JsonKey(name:'lat')
  double lat;
  @JsonKey(name:'lng')
  double lng;

factory WaterSupplyMapModel.fromJson(Map<String, dynamic> json) =>
      _$WaterSupplyMapModelFromJson(json);

}

class WaterSupplyMapModelV2{

  WaterSupplyMapModelV2({
    required this.id,
    required this.decimalDegreeLat,
    required this.decimalDegreeLng,
    required this.waterSupplyCode,
    required this.waterSupplyTypeId
  });

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name:'decimal_degress_lat')
  String decimalDegreeLat; 
  @JsonKey(name:'decimal_degress_lng')
  String decimalDegreeLng;
  @JsonKey(name:'water_supply_type_id')
  int waterSupplyTypeId;
  @JsonKey(name : 'water_supply_code')
  String waterSupplyCode;

  factory WaterSupplyMapModelV2.fromJson(Map<String, dynamic> json) =>
      _$WaterSupplyMapModelV2FromJson(json);

}

WaterSupplyMapModel _$WaterSupplyMapModelFromJson(Map<String, dynamic> json) => WaterSupplyMapModel(
  id: json['id'] as int,
  waterSupplyType: json['water_supply_type_id']['name_kh'] as String,
      address:
          ProvinceModel.fromJson(json['province_id'] as Map<String, dynamic>),
   waterSupplyCode: json['water_supply_code'] as String,
      mapUnitId: json['map_unit'] as int,
      decimalDegreeLat: json['decimal_degress_lat'] as String,
      decimalDegreeLng: json['decimal_degress_lng'] as String,
      waterSupplyTypeId: json['water_supply_type_id']['id'] as int,
      utmX: json['utm_x'] as String,
      utmY: json['utm_y'] as String,
      lat: json['lat'] as double,
      lng: json['lng'] as double
      
   );

   WaterSupplyMapModelV2 _$WaterSupplyMapModelV2FromJson(Map<String, dynamic> json) => WaterSupplyMapModelV2(
    id: json['id'] as int,
    waterSupplyCode: json['water_supply_code'] as String,
      decimalDegreeLat: json['decimal_degress_lat'] as String,
      decimalDegreeLng: json['decimal_degress_lng'] as String,
      waterSupplyTypeId: json['water_supply_type_id'] as int,
      
   );