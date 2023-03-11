import 'package:json_annotation/json_annotation.dart';

part 'register_payload_model.g.dart';

@JsonSerializable()
class RegisterPayloadModel {
  RegisterPayloadModel({
    required this.clientId,
    required this.phoneNumber,
    required this.hashed,
    required this.appSignature,
  });

  @JsonKey(name: 'clientId')
  final String clientId;
  @JsonKey(name: 'phone')
  final String phoneNumber;
  @JsonKey(name: 'hashed')
  final String hashed;
  @JsonKey(name: 'appSignature')
  final String? appSignature;

  factory RegisterPayloadModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterPayloadModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterPayloadModelToJson(this);
}
