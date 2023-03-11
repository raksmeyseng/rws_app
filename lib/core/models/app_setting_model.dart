import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_setting_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AppSettingModel extends Equatable {
  const AppSettingModel({
    required this.isUnderMaintenance,
    required this.latestVersionCode,
    this.forceUpdateVersionCode,
    required this.playStoreUrl,
    required this.appStoreUrl,
  });

  @JsonKey(name: 'isUnderMaintenance')
  final bool isUnderMaintenance;
  @JsonKey(name: 'latestVersionCode')
  final int latestVersionCode;
  @JsonKey(name: 'forceUpdateVersionCode')
  final int? forceUpdateVersionCode;
  @JsonKey(name: 'playStoreUrl')
  final String playStoreUrl;
  @JsonKey(name: 'appStoreUrl')
  final String appStoreUrl;

  @override
  List<Object?> get props => [
        isUnderMaintenance,
        latestVersionCode,
        forceUpdateVersionCode,
        playStoreUrl,
        appStoreUrl,
      ];

  factory AppSettingModel.fromJson(Map<String, dynamic> json) =>
      _$AppSettingModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppSettingModelToJson(this);
}
