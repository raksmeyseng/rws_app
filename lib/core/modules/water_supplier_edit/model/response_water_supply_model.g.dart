part of 'response_water_supply_model.dart';

ResponseWaterSupplyModel _$ResponseWaterSupplyModelFromJson(
  Map<String,dynamic> json) =>
  ResponseWaterSupplyModel(
    status: json['status'] as int,
    //data: PayloadWaterSupplyModel.fromJson(json['data'] as Map<String,dynamic>),
    waterSupplyId: json['data']['id'] as int
    );

Map<String,dynamic> _$ResponseWaterSupplyModelToJson(ResponseWaterSupplyModel instance) =>
<String,dynamic>{
  'status' :instance.status,
};