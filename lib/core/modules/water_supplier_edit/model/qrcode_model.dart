import 'package:json_annotation/json_annotation.dart';

part 'qrcode_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseGenerateQRCode{

  ResponseGenerateQRCode({
    required this.qrName
  });

  @JsonKey(name:'qr_name')
  String qrName;

  factory ResponseGenerateQRCode.fromJson(Map<String, dynamic> json) =>
      _$ResponseGenerateQRCodeFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseGenerateQRCodeToJson(this);
  
}

@JsonSerializable(explicitToJson: true)
class PayloadWaterSupplyQRCodeModel{

  PayloadWaterSupplyQRCodeModel({
    required this.waterSupplyId,
    required this.qrCodeImageName
  });

  @JsonKey(name:'watersupply_id')
  int waterSupplyId;
  @JsonKey(name:'qr_code_image_name')
  String qrCodeImageName;

  factory PayloadWaterSupplyQRCodeModel.fromJson(Map<String, dynamic> json) =>
      _$PayloadWaterSupplyQRCodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadWaterSupplyQRCodeModelToJson(this);
}
