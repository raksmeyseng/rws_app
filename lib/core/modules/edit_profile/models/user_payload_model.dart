import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_payload_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserPayloadModel extends Equatable {
  const UserPayloadModel({
    required this.fullName,
    required this.email,
    this.phoneNumber,
    this.password,
    this.profileId,
    this.profileUrl,
  });

  @JsonKey(name: 'name')
  final String fullName;
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'password')
  final String? password;
  @JsonKey(name: 'profileId')
  final String? profileId;
  @JsonKey(name: 'profileUrl')
  final String? profileUrl;

  @override
  List<Object?> get props => [
        fullName,
        email,
        phoneNumber,
        password,
        profileId,
        profileUrl,
      ];

  UserPayloadModel copyWith({
    bool? active,
    String? fullName,
    String? phoneNumber,
    String? email,
    String? password,
    DateTime? createdDate,
    String? profileId,
    String? profileUrl,
  }) {
    return UserPayloadModel(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      profileId: profileId ?? this.profileId,
      profileUrl: profileUrl ?? this.profileUrl,
    );
  }

  factory UserPayloadModel.fromJson(Map<String, dynamic> json) =>
      _$UserPayloadModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserPayloadModelToJson(this);
}
