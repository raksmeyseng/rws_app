import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_payload_model.g.dart';

@JsonSerializable()
class LoginPayloadModel extends Equatable {
  const LoginPayloadModel({
    required this.clientId,
    required this.email,
    required this.password,
  });
  final String clientId;
  final String email;
  final String password;

  @override
  List<Object?> get props => [clientId, email, password];

  factory LoginPayloadModel.fromJson(Map<String, dynamic> json) =>
      _$LoginPayloadModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginPayloadModelToJson(this);
}
