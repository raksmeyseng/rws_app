part of 'image_uploader_cubit.dart';

class ImageUploaderState extends Equatable {
  const ImageUploaderState._({
    this.widgetId,
    this.uploadStatus = BaseStatusEnum.initial,
    this.uploadedFile = UploadedFileModel.empty,
    this.file,
    this.showActionButton = false,
  });

  const ImageUploaderState.initial(String? widgetId, XFile? file)
      : this._(widgetId: widgetId, file: file);

  final String? widgetId;
  final BaseStatusEnum uploadStatus;
  final UploadedFileModel uploadedFile;
  final XFile? file;
  final bool showActionButton;

  ImageUploaderState copyWith({
    String? widgetId,
    BaseStatusEnum? uploadStatus,
    UploadedFileModel? uploadedFile,
    XFile? file,
    bool? showActionButton,
  }) {
    return ImageUploaderState._(
      widgetId: widgetId ?? this.widgetId,
      uploadStatus: uploadStatus ?? this.uploadStatus,
      uploadedFile: uploadedFile ?? this.uploadedFile,
      file: file ?? this.file,
      showActionButton: showActionButton ?? this.showActionButton,
    );
  }

  @override
  List<Object?> get props => [
        widgetId,
        uploadStatus,
        uploadedFile,
        file,
        showActionButton,
      ];
}
