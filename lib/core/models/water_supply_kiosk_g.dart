part of 'water_supply_kiosk.dart';

WaterSupplyKioskModel _$WaterSupplyKioskModelFromJson(
        Map<String, dynamic> json) =>
    WaterSupplyKioskModel(
      id: json['id'] as int,
      waterSupplyId: json['watersupply_id'] as int,
      abilityOfProductWater: json['abilty_of_produce_water'] as String,
      statusNoReason: json['status_no_reason'] as String,         
      sourceTypeOfWater: (json['watersupplykioskoptionvalue_watersupplykiosk'] as List<dynamic>)
          .map((e) => WaterSupplyOptionModel.fromJson(e as Map<String, dynamic>)).toList(),
      filterSystemObj: (json['filter_system_obj'] as List<dynamic>)
          .map((e) => WaterSupplyOptionValueModel.fromJson(e as Map<String, dynamic>)).toList(),
             statusObj: (json['status_obj'] as List<dynamic>)
          .map((e) => WaterSupplyOptionValueModel.fromJson(e as Map<String, dynamic>)).toList(),
             waterQualityCheckingObj: (json['water_quality_checking_obj'] as List<dynamic>)
          .map((e) => WaterSupplyOptionValueModel.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$WaterSupplyKioskModelToJson(
        WaterSupplyKioskModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'watersupply_id': instance.waterSupplyId,
      'abilty_of_produce_water': instance.abilityOfProductWater,
/*       'filter_system_obj':
          instance.filter_system_obj?.map((e) => e.toJson()).toList(), */
    };

    WaterSupplyOptionModel _$WaterSupplyOptionModelFromJson(
        Map<String, dynamic> json) =>
    WaterSupplyOptionModel(
      id: json['id'] as int,
      waterSupplyKioskId: json['water_supply_kiosk_id'] as int,
      optionId: json['option_id'] as int,
      valueId: json['value_id'] as int,
      valueObjs: (json['value_obj'] as List<dynamic>)
          .map((e) =>
              WaterSupplyOptionValueModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WaterSupplyOptionModelToJson(
        WaterSupplyOptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'water_supply_kiosk_id': instance.waterSupplyKioskId,
      'option_id': instance.optionId,
      'value_id': instance.valueId,
      'value_obj': instance.valueObjs.map((e) => e.toJson()).toList(),
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
