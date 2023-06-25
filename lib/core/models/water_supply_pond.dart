import 'package:json_annotation/json_annotation.dart';
part 'water_supply_pond_g.dart';

@JsonSerializable(explicitToJson: true)
class WaterSupplyPondModel{
  WaterSupplyPondModel({ 
    //required this.id,
    required this.waterSupplyId,
    required this.width,
    required this.length,
    required this.height,
    required this.filterSystemObj, 
    required this.typeOfPond,
    required this.statusObj,
    required this.isSummerHasWaterObj,
    required this.statusNoReason,
  
    });
   
 /*  @JsonKey(name:'id')
  int id; */
  @JsonKey(name:'watersupply_id')
  int waterSupplyId;
  @JsonKey(name:'width')
  String width; 
  @JsonKey(name:'length')
  String length; 
  @JsonKey(name:'height')
  String height;
  @JsonKey(name:'type_of_pond')
  String typeOfPond;
  @JsonKey(name: 'status_no_reason')
  String statusNoReason;
  @JsonKey(name: 'filter_system_obj')
  List<WaterSupplyOptionValueModel> filterSystemObj;
  @JsonKey(name: 'is_summer_has_water_obj')
  List<WaterSupplyOptionValueModel> isSummerHasWaterObj;
  @JsonKey(name: 'status_obj')
  List<WaterSupplyOptionValueModel> statusObj;


  factory WaterSupplyPondModel.fromJson(Map<String, dynamic> json) =>
      _$WaterSupplyPondModelFromJson(json);
  Map<String, dynamic> toJson() => _$WaterSupplyPondModelToJson(this);

}


/* @JsonSerializable(explicitToJson: true)
class WaterSupplyOptionModel {
  WaterSupplyOptionModel({
    required this.id,
    required this,
    required this.optionId,
    required this.valueId,
    required this.valueObjs,
  });

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'water_supply__id')
  int waterSupplyKioskId;
  @JsonKey(name: 'option_id')
  int optionId;
  @JsonKey(name: 'value_id')
  int valueId;
  @JsonKey(name: 'value_obj')
  List<WaterSupplyOptionValueModel> valueObjs;

  factory WaterSupplyOptionModel.fromJson(Map<String, dynamic> json) =>
      _$WaterSupplyOptionModelFromJson(json);
  Map<String, dynamic> toJson() => _$WaterSupplyOptionModelToJson(this);
}
 */
@JsonSerializable(explicitToJson: true)
class WaterSupplyOptionValueModel {
  WaterSupplyOptionValueModel({
    required this.id,
    required this.code,
    required this.nameEn,
    required this.nameKh,
    required this.waterSupplyOptionId,
  });

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'code')
  String code;
  @JsonKey(name: 'name_en')
  String nameEn;
  @JsonKey(name: 'name_kh')
  String nameKh;
  @JsonKey(name: 'water_supply_option_id')
  int waterSupplyOptionId;

  factory WaterSupplyOptionValueModel.fromJson(Map<String, dynamic> json) =>
      _$WaterSupplyOptionValueModelFromJson(json);
  Map<String, dynamic> toJson() => _$WaterSupplyOptionValueModelToJson(this);
}
