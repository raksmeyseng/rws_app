import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_setting_model.g.dart';

@JsonSerializable()
class UserSettingModel extends Equatable {
  const UserSettingModel({
    this.pin,
    this.biometricEnabled,
    this.profileMediaId,
    this.profileMediaUrl,
    this.languageCode,
    this.nextAllowLogin,
  });

  @JsonKey(name: 'pin')
  final String? pin;
  @JsonKey(name: 'biometricEnable')
  final bool? biometricEnabled;
  @JsonKey(name: 'profileMediaId')
  final String? profileMediaId;
  @JsonKey(name: 'profileUrl')
  final String? profileMediaUrl;
  @JsonKey(name: 'language')
  final String? languageCode;
  @JsonKey(name: 'nextAllowLogin')
  final DateTime? nextAllowLogin;

  @override
  List<Object?> get props => [
        pin,
        biometricEnabled,
        profileMediaId,
        profileMediaUrl,
        languageCode,
        nextAllowLogin,
      ];

  UserSettingModel copyWith({
    String? pin,
    bool? biometricEnabled,
    String? profileMediaId,
    String? profileMediaUrl,
    String? languageCode,
    DateTime? nextAllowLogin,
  }) {
    return UserSettingModel(
      pin: pin ?? this.pin,
      biometricEnabled: biometricEnabled ?? this.biometricEnabled,
      profileMediaId: profileMediaId ?? this.profileMediaId,
      profileMediaUrl: profileMediaUrl ?? this.profileMediaUrl,
      languageCode: languageCode ?? this.languageCode,
      nextAllowLogin: nextAllowLogin ?? this.nextAllowLogin,
    );
  }

  factory UserSettingModel.fromJson(Map<String, dynamic> json) =>
      _$UserSettingModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserSettingModelToJson(this);
}
