import 'package:json_annotation/json_annotation.dart';
part 'water_supply_small_pipe.g.dart';

@JsonSerializable(explicitToJson: true)
class WaterSupplySmallPipeModel {
  WaterSupplySmallPipeModel({
    required this.id,
    required this.waterSupplyId,
    required this.abilityOfProductWater,
    required this.underGroudPoolStorage,
    required this.numberOfLink,
    required this.poolFilter,
    required this.poolAir,
    required this.poolFilterObj,
    required this.wateQualityCheckObj,
    required this.statusObj,
    required this.sourceTypeOfWater,
    required this.pipeLength,
    required this.areaCovering,
  });

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'watersupply_id')
  int waterSupplyId;
  @JsonKey(name: 'abilty_of_produce_water')
  String abilityOfProductWater;
  @JsonKey(name: 'underground_pool_storage')
  String underGroudPoolStorage;
  @JsonKey(name: 'number_of_link')
  String numberOfLink;
  @JsonKey(name: 'pool_air')
  String poolAir;
  @JsonKey(name: 'pool_filter')
  String poolFilter;
  @JsonKey(name: 'pipe_length')
  String pipeLength;
  @JsonKey(name: 'area_covering')
  String areaCovering;

  @JsonKey(name: 'pool_filter_obj')
  List<WaterSupplyOptionValueModel> poolFilterObj;
  @JsonKey(name: 'water_quality_check_obj')
  List<WaterSupplyOptionValueModel> wateQualityCheckObj;
  @JsonKey(name: 'status_obj')
  List<WaterSupplyOptionValueModel> statusObj;
  @JsonKey(name: 'source_type_of_water')
  List<WaterSupplyOptionModel> sourceTypeOfWater;

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
