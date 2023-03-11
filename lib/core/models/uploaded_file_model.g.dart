// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uploaded_file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadedFileModel _$UploadedFileModelFromJson(Map<String, dynamic> json) =>
    UploadedFileModel(
      id: json['id'] as String,
      name: json['name'] as String?,
      path: json['path'] as String?,
      url: json['url'] as String,
      createdBy: json['createdBy'] as String?,
      mimeType: json['mimeType'] as String?,
      app: json['app'] as String?,
      section: json['section'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$UploadedFileModelToJson(UploadedFileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdBy': instance.createdBy,
      'mimeType': instance.mimeType,
      'path': instance.path,
      'url': instance.url,
      'app': instance.app,
      'section': instance.section,
      'note': instance.note,
    };
