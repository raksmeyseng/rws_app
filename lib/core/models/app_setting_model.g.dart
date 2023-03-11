// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_setting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppSettingModel _$AppSettingModelFromJson(Map<String, dynamic> json) =>
    AppSettingModel(
      isUnderMaintenance: json['isUnderMaintenance'] as bool,
      latestVersionCode: json['latestVersionCode'] as int,
      forceUpdateVersionCode: json['forceUpdateVersionCode'] as int?,
      playStoreUrl: json['playStoreUrl'] as String,
      appStoreUrl: json['appStoreUrl'] as String,
    );

Map<String, dynamic> _$AppSettingModelToJson(AppSettingModel instance) =>
    <String, dynamic>{
      'isUnderMaintenance': instance.isUnderMaintenance,
      'latestVersionCode': instance.latestVersionCode,
      'forceUpdateVersionCode': instance.forceUpdateVersionCode,
      'playStoreUrl': instance.playStoreUrl,
      'appStoreUrl': instance.appStoreUrl,
    };
