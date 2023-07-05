import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class ChangePasswordModel extends Equatable {
  const ChangePasswordModel({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmNewPassword,
  });

  @JsonKey(name: 'old_password')
  final String currentPassword;
  @JsonKey(name: 'password')
  final String newPassword;
  @JsonKey(name: 'password2')
  final String confirmNewPassword;

  @override
  List<Object?> get props => [
    currentPassword,
    newPassword,
    confirmNewPassword,
  ];

  ChangePasswordModel copyWith({
    String? currentPassword,
    String? newPassword,
    String? confirmNewPassword,
  }) {
    return ChangePasswordModel(
      currentPassword: currentPassword ?? this.currentPassword,
      newPassword: newPassword ?? this.newPassword,
      confirmNewPassword: confirmNewPassword ?? this.confirmNewPassword,
    );
  }

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordModelToJson(this);
}

ChangePasswordModel _$ChangePasswordModelFromJson(Map<String, dynamic> json) =>
    ChangePasswordModel(
      currentPassword: json['old_password'],
      newPassword: json['password'],
      confirmNewPassword: json['password2'],
    );

Map<String, dynamic> _$ChangePasswordModelToJson(ChangePasswordModel instance) =>
    <String, dynamic>{
      'old_password': instance.currentPassword,
      'password': instance.newPassword,
      'password2': instance.confirmNewPassword,
    };
