part of 'qrcode_model.dart';

ResponseGenerateQRCode _$ResponseGenerateQRCodeFromJson(Map<String,dynamic> json) =>
ResponseGenerateQRCode(qrName: json['qr_name'] as String);

Map<String,dynamic> _$ResponseGenerateQRCodeToJson(ResponseGenerateQRCode instance)=>
<String,dynamic>{
  'qr_name' : instance.qrName
};

PayloadWaterSupplyQRCodeModel _$PayloadWaterSupplyQRCodeModelFromJson(Map<String,dynamic> json) =>
PayloadWaterSupplyQRCodeModel(
  waterSupplyId: json['watersupply_id'] as int, 
  qrCodeImageName: json['qr_code_image_name'] as String
  );

Map<String,dynamic> _$PayloadWaterSupplyQRCodeModelToJson(PayloadWaterSupplyQRCodeModel instance) =>
<String,dynamic>{
  'watersupply_id' : instance.waterSupplyId,
  'qr_code_image_name' : instance.qrCodeImageName
};