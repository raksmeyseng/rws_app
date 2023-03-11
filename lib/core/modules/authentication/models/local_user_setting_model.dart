import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'local_user_setting_model.g.dart';

@JsonSerializable()
class LocalUserSettingModel extends Equatable {
  const LocalUserSettingModel({
    this.biometricEnabled = false,
  });
  final bool biometricEnabled;

  LocalUserSettingModel copyWith({
    bool? biometricEnabled,
  }) {
    return LocalUserSettingModel(
      biometricEnabled: biometricEnabled ?? this.biometricEnabled,
    );
  }

  @override
  List<Object?> get props => [biometricEnabled];

  factory LocalUserSettingModel.fromJson(Map<String, dynamic> json) =>
      _$LocalUserSettingModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocalUserSettingModelToJson(this);
}
