// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_saver_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageSaverResultModel _$ImageSaverResultModelFromJson(
        Map<String, dynamic> json) =>
    ImageSaverResultModel(
      isSuccess: json['isSuccess'] as bool,
      filePath: json['filePath'] as String?,
    );

Map<String, dynamic> _$ImageSaverResultModelToJson(
        ImageSaverResultModel instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'filePath': instance.filePath,
    };
