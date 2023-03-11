import 'package:rws_app/core/enum/gender_enum.dart';
import 'package:rws_app/core/modules/authentication/models/register_response_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'register_data_model.g.dart';

@JsonSerializable()
class RegisterDataModel {
  RegisterDataModel({
    required this.fullName,
    this.dateOfBirth,
    this.gender,
    required this.phoneNumber,
    this.email,
    required this.registerResponse,
  });

  final String fullName;
  final DateTime? dateOfBirth;
  final GenderEnum? gender;
  final String phoneNumber;
  final String? email;
  final RegisterResponseModel registerResponse;

  factory RegisterDataModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterDataModelToJson(this);
}
