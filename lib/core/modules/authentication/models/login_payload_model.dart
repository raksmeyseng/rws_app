import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_payload_model.g.dart';

@JsonSerializable()
class LoginPayloadModel extends Equatable {
  const LoginPayloadModel({
    required this.username,
    required this.password,
  });
  final String username;
  final String password;

  @override
  List<Object?> get props => [username, password];

  factory LoginPayloadModel.fromJson(Map<String, dynamic> json) =>
      _$LoginPayloadModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginPayloadModelToJson(this);
}
