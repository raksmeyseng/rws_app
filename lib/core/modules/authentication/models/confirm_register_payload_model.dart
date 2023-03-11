import 'package:rws_app/core/enum/gender_enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'confirm_register_payload_model.g.dart';

@JsonSerializable()
class ConfirmRegisterPayloadModel {
  ConfirmRegisterPayloadModel({
    required this.clientId,
    required this.phoneNumber,
    required this.otpCode,
    required this.fullName,
    this.dateOfBirth,
    this.gender,
    this.email,
    required this.session,
  });

  @JsonKey(name: 'clientId')
  final String clientId;
  @JsonKey(name: 'phone')
  final String phoneNumber;
  @JsonKey(name: 'code')
  final String otpCode;
  @JsonKey(name: 'name')
  final String fullName;
  @JsonKey(name: 'dateOfBirth')
  final DateTime? dateOfBirth;
  @JsonKey(name: 'gender')
  final GenderEnum? gender;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'session')
  final String? session;

  factory ConfirmRegisterPayloadModel.fromJson(Map<String, dynamic> json) =>
      _$ConfirmRegisterPayloadModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmRegisterPayloadModelToJson(this);
}
