import 'package:rws_app/core/enum/gender_enum.dart';
import 'package:rws_app/core/modules/authentication/models/user_setting_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel extends Equatable {
  const UserModel({
    required this.id,
    required this.fullName,
    this.active,
    this.dateOfBirth,
    this.gender,
    this.phoneNumber,
    this.email,
    this.isLocked,
    this.currentSessionId,
    this.lastLoginTime,
    required this.createdDate,
    this.settings,
    this.password,
    this.profileId,
    this.profileUrl,
  });

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'active')
  final bool? active;
  @JsonKey(name: 'name')
  final String fullName;
  @JsonKey(name: 'dateOfBirth')
  final DateTime? dateOfBirth;
  @JsonKey(name: 'gender')
  final GenderEnum? gender;
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'isLocked')
  final bool? isLocked;
  @JsonKey(name: 'currentSessionId')
  final String? currentSessionId;
  @JsonKey(name: 'lastLoginTime')
  final DateTime? lastLoginTime;
  @JsonKey(name: 'createdDate')
  final DateTime createdDate;
  @JsonKey(name: 'userSetting')
  final UserSettingModel? settings;
  @JsonKey(name: 'password')
  final String? password;
  @JsonKey(name: 'profileId')
  final String? profileId;
  @JsonKey(name: 'profileUrl')
  final String? profileUrl;

  @override
  List<Object?> get props => [
        id,
        active,
        fullName,
        dateOfBirth,
        gender,
        phoneNumber,
        email,
        isLocked,
        currentSessionId,
        lastLoginTime,
        createdDate,
        settings,
        password,
        profileId,
        profileUrl,
      ];

  UserModel copyWith({
    int? id,
    bool? active,
    String? fullName,
    DateTime? dateOfBirth,
    GenderEnum? gender,
    String? phoneNumber,
    String? email,
    bool? isLocked,
    String? currentSessionId,
    DateTime? lastLoginTime,
    DateTime? createdDate,
    UserSettingModel? settings,
    String? password,
    String? profileId,
    String? profileUrl,
  }) {
    return UserModel(
      id: id ?? this.id,
      active: active ?? this.active,
      fullName: fullName ?? this.fullName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      isLocked: isLocked ?? this.isLocked,
      currentSessionId: currentSessionId ?? this.currentSessionId,
      lastLoginTime: lastLoginTime ?? this.lastLoginTime,
      createdDate: createdDate ?? this.createdDate,
      settings: settings ?? this.settings,
      profileId: profileId ?? this.profileId,
      profileUrl: profileUrl ?? profileUrl,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
