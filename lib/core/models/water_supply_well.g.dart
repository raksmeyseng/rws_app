
part of 'water_supply_well.dart';

WaterSupplyWellModel _$WaterSupplyWellModelFromJson(Map<String,dynamic> json)=> 
WaterSupplyWellModel(id:json['id'] as int, 
waterSupplyId: json['watersupply_id'] as int, 
wellHeight: json['well_height'] as String, 
wellFilterHeight: json['well_filter_height'] as String, 
wellNirodynamic: json['well_nirodynamic'] as String, 
wellNirostatic: json['well_nirostatic'] as String, 
wellStatus: json['well_status'] as String, 
wellStatusReason: json['well_status_reason'] as String,
 wellWaterQuality: json['well_watar_quality'] as String, 
 wellWaterQualityCheck: json['well_water_quality_check'] as String, 
  wellWaterSupply: json['well_water_supply'] as String,
  wellWaterQualityObj: List<WaterSupplyOptionValueModel>.from(json['well_watar_quality_obj'].map((model)=>WaterSupplyOptionValueModel.fromJson(model))),
  wellWaterQualityCheckObj: List<WaterSupplyOptionValueModel>.from(json['well_water_quality_check_obj'].map((model)=>WaterSupplyOptionValueModel.fromJson(model))),
  wellStatusObj: List<WaterSupplyOptionValueModel>.from(json['well_status_obj'].map((model)=>WaterSupplyOptionValueModel.fromJson(model))),
  wellTypeObj: List<WaterSupplyOptionModel>.from(json['well_type_obj'].map((model)=>WaterSupplyOptionModel.fromJson(model))),
);

Map<String,dynamic> _$WaterSupplyWellModelToJson(WaterSupplyWellModel instance)=>
<String,dynamic>{
  'id':instance.id,
  'watersupply_id':instance.waterSupplyId,
  'well_height':instance.wellHeight,
  'well_filter_height':instance.wellFilterHeight,
  'well_nirodynamic':instance.wellNirodynamic,
  'well_nirostatic':instance.wellNirostatic,
  'well_status':instance.wellStatus,
  'well_status_reason':instance.wellStatusReason,
  'well_watar_quality':instance.wellWaterQuality,
  'well_water_quality_check':instance.wellWaterQualityCheck,
  'well_water_supply':instance.wellWaterSupply
};

WaterSupplyOptionValueModel _$WaterSupplyOptionValueModelFromJson(Map<String,dynamic> json)=>
WaterSupplyOptionValueModel(
  id: json['id'] as int,
  code: json['code'] as String,
  nameEn: json['name_en'] as String, 
  nameKh: json['name_kh'] as String, 
  
  waterSupplyOptionId: json['water_supply_option_id'] as int,
  
  );

Map<String,dynamic> _$WaterSupplyOptionValueModelToJson(WaterSupplyOptionValueModel instance)=>
<String,dynamic>{
  'id':instance.id,
  'code':instance.code,
  'name_en':instance.nameEn,
  'name_kh':instance.nameKh,
  'water_supply_option_id':instance.waterSupplyOptionId
};

WaterSupplyOptionModel _$WaterSupplyOptionModelFromJson(Map<String,dynamic> json)=>
WaterSupplyOptionModel(
  id: json['id'] as int,
 waterSupplyWellId: json['water_supply_well_id'] as int,
  optionId: json['option_id'] as int, 
  valueId: json['value_id'] as int, 
  valueObjs: List<WaterSupplyOptionValueModel>.from(json['value_obj'].map((model)=>WaterSupplyOptionValueModel.fromJson(model)))
  );