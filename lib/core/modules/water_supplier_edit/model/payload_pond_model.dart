import 'package:json_annotation/json_annotation.dart';

part 'payload_pond_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PayloadPondModel{

  PayloadPondModel({
    required this.waterSupplyId,
    required this.width,
    required this.length,
    required this.height,
    required this.poolFilter,
    required this.status,
    required this.statusNoReason,
    required this.isActive,
    required this.typeOfPond,
    required this.isSummerHasWater,
    //required this.poolFilterObj,
    //this.id,
  });

  //@JsonKey(name:'id')
  //int? id;
  @JsonKey(name:'watersupply_id')
  int waterSupplyId;
  @JsonKey(name:'is_active')
  bool isActive;
  @JsonKey(name:'width')
  String width;
  @JsonKey(name:'length')
  String length;
  @JsonKey(name:'height')
  String height;
  @JsonKey(name:'pool_filter')
  String poolFilter;
  @JsonKey(name:'status')
  String status;
  @JsonKey(name:'status_no_reason')
  String statusNoReason;
  @JsonKey(name:'type_of_pond')
  String typeOfPond;
  @JsonKey(name:'is_summer_has_water')
  String isSummerHasWater;
 //  @JsonKey(name:'pool_filter_obj')
  //String poolFilterObj;

  
  factory PayloadPondModel.fromJson(Map<String, dynamic> json) =>
      _$PayloadPondModelFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadPondModelToJson(this);

}

@JsonSerializable(explicitToJson: true)
class PayloadPondOptionValueModel{

  PayloadPondOptionValueModel({
    required this.waterSupplyWellId,
    required this.optionId,
    required this.valueId,
    required this.isActive
  });

  @JsonKey(name:'water_supply_well_id')
  int waterSupplyWellId;
  @JsonKey(name:'option_id')
  int optionId;
  @JsonKey(name:'value_id')
  int valueId;
  @JsonKey(name:'is_active')
  bool isActive;

  factory PayloadPondOptionValueModel.fromJson(Map<String, dynamic> json) =>
      _$PayloadPondOptionValueModelFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadPondOptionValueModelToJson(this);

}