import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/constants/api_path.dart';
import 'package:rws_app/constants/app_constant.dart';
import 'package:rws_app/core/models/uploaded_file_model.dart';
import 'package:rws_app/core/services/rest_api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class MediaRepository extends RestApiService {
  // ===================
  // Upload file for iOS/Android
  // ===================
  Future<UploadedFileModel> uploadFile(XFile file,
      [String? savedFileName]) async {
    final lastPath = file.path.split('/').last;
    final ext = lastPath.split('.').last;
    final fileName = savedFileName?.isNotEmpty == true && ext.isNotEmpty
        ? '$savedFileName.$ext'
        : lastPath;

    const String app = AppConstant.clientId;
    final String section = DateTime.now().year.toString();
    final multipartFile =
        await MultipartFile.fromFile(file.path, filename: fileName);
    final formData = FormData.fromMap({
      'file': multipartFile,
      'fileName': fileName,
      'app': app,
      'section': section,
      'note': Application.appBloc.state.packageInfo?.packageName,
      'mediaTypeId': 0,
      'imageSizeTypes': '[]',
    });

    final authState = Application.authBloc.state;
    final base64Username =
        base64.encode(utf8.encode(authState.user?.fullName ?? '--'));

    final headers = {
      'x-uploader': base64Username,
      'content-type': 'multipart/form-data',
      'cache-control': 'no-cache',
      'accept': 'application/json',
    };

    final queries = {'app': app, 'section': section};

    final res = await post(
      ApiPath.uploadFile,
      data: formData,
      headers: headers,
      queryParameters: queries,
    );
    // final json = jsonDecode(res) as Map<String, dynamic>;
    return UploadedFileModel.fromJson(res);
  }

  // =====================
  // Upload file for Web
  // =====================
  Future<UploadedFileModel> uploadFileForWeb(XFile file,
      [String? savedFileName]) async {
    if (!kIsWeb) throw 'Unsupported platform';
    final fileName = savedFileName ?? file.name;

    const String app = AppConstant.clientId;
    final String section = DateTime.now().year.toString();
    final bytes = await file.readAsBytes();
    final multipartFile = MultipartFile.fromBytes(bytes, filename: fileName);

    final formData = FormData.fromMap({
      'file': multipartFile,
      'fileName': fileName,
      'app': app,
      'section': section,
      'note': Application.appBloc.state.packageInfo?.packageName,
      'mediaTypeId': 0,
      'imageSizeTypes': '[]',
    });

    final authState = Application.authBloc.state;
    final base64Username =
        base64.encode(utf8.encode(authState.user?.fullName ?? '--'));

    final headers = {
      'x-uploader': base64Username,
      'content-type': 'multipart/form-data',
      'cache-control': 'no-cache',
      'accept': 'application/json',
    };

    final queries = {'app': app, 'section': section};

    final res = await post(
      ApiPath.uploadFile,
      data: formData,
      headers: headers,
      queryParameters: queries,
    );
    // final json = jsonDecode(res) as Map<String, dynamic>;
    return UploadedFileModel.fromJson(res);
  }

  // =====================
  // Upload multiple files for Web
  // =====================
  Future<List<UploadedFileModel>> uploadMultiFileForWeb(
      List<XFile> files) async {
    if (!kIsWeb) throw 'Unsupported platform';

    const String app = AppConstant.clientId;
    final String section = DateTime.now().year.toString();

    List<dynamic> documents = [];
    for (var i = 0; i < files.length; i++) {
      final bytes = await files[i].readAsBytes();
      final multipartFile =
          MultipartFile.fromBytes(bytes, filename: files[i].name);
      documents.add(multipartFile);
    }

    final formData = FormData.fromMap({
      'documents': documents,
      'app': app,
      'section': section,
      'note': Application.appBloc.state.packageInfo?.packageName,
      'mediaTypeId': 0,
      'imageSizeTypes': '[]'
    });

    final authState = Application.authBloc.state;
    final base64Username =
        base64.encode(utf8.encode(authState.user?.fullName ?? '--'));

    final headers = {
      'x-uploader': base64Username,
      'content-type': 'multipart/form-data',
      'cache-control': 'no-cache',
      'accept': 'application/json',
    };

    final queries = {'app': app, 'section': section};

    final res = await post(
      ApiPath.uploadFile,
      data: formData,
      headers: headers,
      queryParameters: queries,
    );
    // final json = jsonDecode(res) as Map<String, dynamic>;
    return res
        .map<UploadedFileModel>((x) => UploadedFileModel.fromJson(x))
        .toList();
  }
}
