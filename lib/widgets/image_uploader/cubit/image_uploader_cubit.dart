import 'dart:developer';

import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/models/uploaded_file_model.dart';
import 'package:rws_app/utils/event/event_type.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher_string.dart';

part 'image_uploader_state.dart';

class ImageUploaderCubit extends Cubit<ImageUploaderState> {
  ImageUploaderCubit(String? widgetId, XFile file)
      : super(ImageUploaderState.initial(widgetId, file));

  Future<void> startUploading([XFile? file]) async {
    try {
      if (state.file == null && file == null) {
        throw 'File must not be null';
      }
      emit(state.copyWith(
        uploadStatus: BaseStatusEnum.inprogress,
        file: file,
      ));
      if (kIsWeb) {
        final uploaded =
            await Application.mediaRepo.uploadFileForWeb(state.file!);
        emit(state.copyWith(
          uploadStatus: BaseStatusEnum.success,
          uploadedFile: uploaded,
        ));
      } else {
        final uploaded = await Application.mediaRepo.uploadFile(state.file!);
        emit(state.copyWith(
          uploadStatus: BaseStatusEnum.success,
          uploadedFile: uploaded,
        ));
      }
    } catch (e) {
      emit(state.copyWith(uploadStatus: BaseStatusEnum.failure));
    }
  }

  void cancelUploading() {
    Application.eventBus.fire(NewsAttachmentRemoved(state.widgetId ?? ''));
  }

  Future<void> openFile() async {
    try {
      await launchUrlString(
        state.uploadedFile.url,
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
      inspect(e);
    }
  }

  void toggleActionButton(bool showed) {
    emit(state.copyWith(showActionButton: showed));
  }
}
