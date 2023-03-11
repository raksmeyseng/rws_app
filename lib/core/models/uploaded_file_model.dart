import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'uploaded_file_model.g.dart';

@JsonSerializable()
class UploadedFileModel extends Equatable {
  const UploadedFileModel({
    required this.id,
    this.name,
    this.path,
    required this.url,
    this.createdBy,
    this.mimeType,
    this.app,
    this.section,
    this.note,
  });

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'createdBy')
  final String? createdBy;
  @JsonKey(name: 'mimeType')
  final String? mimeType;
  @JsonKey(name: 'path')
  final String? path;
  @JsonKey(name: 'url')
  final String url;
  @JsonKey(name: 'app')
  final String? app;
  @JsonKey(name: 'section')
  final String? section;
  @JsonKey(name: 'note')
  final String? note;

  static const empty = UploadedFileModel(id: '', url: '');

  @override
  List<Object?> get props => [
        id,
        name,
        createdBy,
        mimeType,
        path,
        url,
        app,
        section,
        note,
      ];

  factory UploadedFileModel.fromJson(Map<String, dynamic> json) =>
      _$UploadedFileModelFromJson(json);
  Map<String, dynamic> toJson() => _$UploadedFileModelToJson(this);
}
