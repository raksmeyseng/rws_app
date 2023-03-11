import 'package:json_annotation/json_annotation.dart';

part 'register_response_model.g.dart';

@JsonSerializable()
class RegisterResponseModel {
  RegisterResponseModel({
    this.fullName,
    this.phoneNumber,
    required this.session,
  });

  @JsonKey(name: 'name')
  final String? fullName;
  @JsonKey(name: 'phone')
  final String? phoneNumber;
  @JsonKey(name: 'session')
  final String session;

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseModelToJson(this);
}
