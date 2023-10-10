import 'package:json_annotation/json_annotation.dart';
import 'package:rws_app/translation/generated/l10n.dart';
part 'water_supply_small_pipe.g.dart';
@JsonSerializable(explicitToJson: true)
class WaterSupplySmallPipeModel {
  WaterSupplySmallPipeModel({
    required this.id,
    required this.waterSupplyId,
    required this.abilityOfProductWater,
    required this.underGroudPoolStorage,
    required this.number_of_link,
    required this.pool_filter,
    required this.pool_air,
    required this.pool_filter_obj,
    required this.water_quality_check_obj,
    required this.status_obj,
    required this.source_type_of_water,
    required this.pipe_length,
    required this.area_covering,
  });
  
  @JsonKey(name:'id')
  int id;
  @JsonKey(name:'watersupply_id')
  int waterSupplyId;
  @JsonKey(name:'abilty_of_produce_water')
  String abilityOfProductWater;
  @JsonKey(name:'underground_pool_storage')
  String underGroudPoolStorage;
  @JsonKey(name:'number_of_link')
  String number_of_link;
  @JsonKey(name:'pool_air')
  String pool_air;
  @JsonKey(name:'pool_filter')
  String pool_filter;
  @JsonKey(name:'pipe_length')
  String pipe_length;
  @JsonKey(name:'area_covering')
  String area_covering;


  
  @JsonKey(name: 'pool_filter_obj')
  List<WaterSupplyOptionValueModel> pool_filter_obj;
  @JsonKey(name: 'water_quality_check_obj')
  List<WaterSupplyOptionValueModel> water_quality_check_obj;
  @JsonKey(name: 'status_obj')
  List<WaterSupplyOptionValueModel> status_obj;
    @JsonKey(name: 'source_type_of_water')
  List<WaterSupplyOptionModel> source_type_of_water;

  factory WaterSupplySmallPipeModel.fromJson(Map<String, dynamic> json) =>
      _$WaterSupplySmallPipeModelFromJson(json);
  Map<String, dynamic> toJson() => _$WaterSupplySmallPipeModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class WaterSupplyOptionModel {
  WaterSupplyOptionModel({
    required this.id,
    required this.waterSupplySmallPipeId,    
    required this.optionId,
    required this.valueId,
    required this.valueObjs,
  });

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'water_supply_pipe_id')
  int waterSupplySmallPipeId;
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
