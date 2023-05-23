import 'package:json_annotation/json_annotation.dart';

part 'water_supply_qrcode.g.dart';

@JsonSerializable(explicitToJson: true)
class WaterSupplyQRCodeModel{

  WaterSupplyQRCodeModel({
    required this.id,
    required this.waterSupplyId,
    required this.qrCodeImageName
  });

  @JsonKey(name:'id')
  int id;
  @JsonKey(name:'watersupply_id')
  int waterSupplyId;
  @JsonKey(name:'qr_code_image_name')
  String qrCodeImageName;

  factory WaterSupplyQRCodeModel.fromJson(Map<String, dynamic> json) =>
      _$WaterSupplyQRCodeModelToJson(json);

}