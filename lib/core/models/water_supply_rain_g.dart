part of 'water_supply_rain.dart';

WaterSupplyRainModel _$WaterSupplyRainModelFromJson(
        Map<String, dynamic> json) =>
    WaterSupplyRainModel(
      waterSupplyId: json['watersupply_id'] as int,
      statusNoReason: json['status_no_reason'] as String,
      waterQualityCheckObj: (json['water_quality_checking_obj']
              as List<dynamic>)
          .map((e) =>
              WaterSupplyOptionValueModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      capacityOfRainWaterHarvesting:
          (json['capacity_of_rain_water_harvesting_obj'] as List<dynamic>)
              .map((e) => WaterSupplyOptionValueModel.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      statusObj: (json['status_obj'] as List<dynamic>)
          .map((e) =>
              WaterSupplyOptionValueModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      typeOfUsing: (json['type_of_using_obj'] as List<dynamic>)
          .map((e) =>
              WaterSupplyOptionValueModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WaterSupplyRainModelToJson(
        WaterSupplyRainModel instance) =>
    <String, dynamic>{
      'watersupply_id': instance.waterSupplyId,
      'status_no_reason': instance.statusNoReason,
      'water_quality_check_obj':
          instance.waterQualityCheckObj.map((e) => e.toJson()).toList(),
      'capacity_of_rain_water_harvesting_obj': instance
          .capacityOfRainWaterHarvesting
          .map((e) => e.toJson())
          .toList(),
      'status_obj': instance.statusObj.map((e) => e.toJson()).toList(),
      'type_of_using': instance.typeOfUsing.map((e) => e.toJson()).toList(),
    };

WaterSupplyOptionValueModel _$WaterSupplyOptionValueModelFromJson(
        Map<String, dynamic> json) =>
    WaterSupplyOptionValueModel(
      id: json['id'] as int,
      code: json['code'] as String,
      nameEn: json['name_en'] as String,
      nameKh: json['name_kh'] as String,
      waterSupplyOptionId: json['water_supply_option_id'] as int,
    );

Map<String, dynamic> _$WaterSupplyOptionValueModelToJson(
        WaterSupplyOptionValueModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name_en': instance.nameEn,
      'name_kh': instance.nameKh,
      'water_supply_option_id': instance.waterSupplyOptionId,
    };
