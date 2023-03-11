import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_saver_result_model.g.dart';

@JsonSerializable()
class ImageSaverResultModel extends Equatable {
  const ImageSaverResultModel({
    required this.isSuccess,
    this.filePath,
  });

  @JsonKey(name: 'isSuccess')
  final bool isSuccess;
  @JsonKey(name: 'filePath')
  final String? filePath;

  @override
  List<Object?> get props => [isSuccess, filePath];

  factory ImageSaverResultModel.fromJson(Map<String, dynamic> json) =>
      _$ImageSaverResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageSaverResultModelToJson(this);
}
