part of 'water_supply_pond.dart';

WaterSupplyPondModel _$WaterSupplyPondModelFromJson(
        Map<String, dynamic> json) =>
    WaterSupplyPondModel(
     // id: json['id'] as int,
      waterSupplyId: json['watersupply_id'] as int,
      width: json['width'] as String,
      length: json['length'] as String,
      height: json['height'] as String,
      typeOfPond: json['type_of_pond'] as String,
      statusNoReason: json['status_no_reason'] as String,   

      filterSystemObj: List<WaterSupplyOptionValueModel>.from(json['pool_filter_obj'].map((model)=>WaterSupplyOptionValueModel.fromJson(model))),

      statusObj: List<WaterSupplyOptionValueModel>.from(json['status_obj'].map((model)=>WaterSupplyOptionValueModel.fromJson(model))),
      isSummerHasWaterObj: List<WaterSupplyOptionValueModel>.from(json['is_summer_has_water_obj'].map((model)=>WaterSupplyOptionValueModel.fromJson(model))),
    );

Map<String, dynamic> _$WaterSupplyPondModelToJson(
        WaterSupplyPondModel instance) =>
    <String, dynamic>{
      //'id': instance.id,
      'watersupply_id': instance.waterSupplyId,
      'width': instance.width,
      'length': instance.length,
      'height': instance.height,
      'type_of_pond': instance.typeOfPond,
      'status_no_reason': instance.statusNoReason,
 
 /*      'filter_system_obj':
          instance.filter_system_obj?.map((e) => e.toJson()).toList(), */
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
