import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_payload_model.g.dart';

@JsonSerializable()
class RefreshTokenPayloadModel {
  RefreshTokenPayloadModel({
    required this.clientId,
    required this.refreshToken,
  });

  final String clientId;
  final String refreshToken;

  factory RefreshTokenPayloadModel.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenPayloadModelFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenPayloadModelToJson(this);
}
