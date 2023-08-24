import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/enum/internet_status_enum.dart';
import 'package:rws_app/core/widgets/dialogs/alert_message_dialog.dart';
import 'package:rws_app/core/widgets/dialogs/error_message_dialog.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:rws_app/utils/helpers/dialog_helper.dart';
import 'package:rws_app/utils/helpers/loading_helper.dart';
import 'package:rws_app/utils/helpers/network_helper.dart';

class RestApiService {
  static bool _errorDialogShowed = false;
  final Dio _dio = Dio();

  RestApiService() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final online = await NetworkHelper.isNetworkConnected();
          if (!online && options.extra['showOfflineDialog'] != false) {
            final error = DioError(
              requestOptions: options,
              type: DioErrorType.other,
              error: InternetStatusEnum.offline,
            );
            return handler.reject(error, true);
          }
          options.baseUrl = _normalizeBaseUrl(_baseUrl);
          options.path = _normalizePath(options.path);
          // options.headers['Lang'] =
          //     appBloc.state.language.getLocale().languageCode;
          // options.headers['X-UserName'] = base64Username;
          // options.headers['X-RefreshToken'] =
          //     authBloc.state.userToken?.data.token;
          // options.headers['Authorization'] =
          //     'Bearer ${authBloc.state.userToken?.data.token}';
          return handler.next(options); //continue
        },
        onError: (DioError e, handler) async {
          // Clear loading
          await LoadingHelper.close();
          // Handle error message
          if (e.response?.statusCode == HttpStatus.unauthorized) {
            _unauthorizedHandler();
          } else if (e.response?.statusCode == HttpStatus.badRequest) {
            _badrequestHandler(e.response!.data);
          } else if (e.response?.statusCode == HttpStatus.noContent) {
            return handler.resolve(
              Response(
                requestOptions: e.requestOptions,
                data: '',
              ),
            );
          } else if (e.error == InternetStatusEnum.offline) {
            if (!_errorDialogShowed) {
              _errorDialogShowed = true;
              DialogHelper.showAnimatedDialog(
                pageBuilder: (context, _, __) {
                  return AlertMessageDialog(
                    icon: const Icon(
                      Icons.wifi_off_outlined,
                      size: 70,
                      color: AppColor.white,
                    ),
                    title: S.of(context).title_no_internet_access,
                    message: S.of(context).msg_check_your_internet_connection,
                  );
                },
              ).then((value) => _errorDialogShowed = false);
            }
          }
          // else {
          //   if (!_errorDialogShowed) {
          //     _errorDialogShowed = true;
          //     DialogHelper.showAnimatedDialog(
          //       context: Application.context!,
          //       pageBuilder: (context, a1, a2) {
          //         return ErrorMessageDialog(
          //           message: S.of(context).load_data_failed,
          //         );
          //       },
          //     ).then((value) => _errorDialogShowed = false);
          //   }
          // }
          return handler.next(e); //continue
        },
      ),
    );
  }

  String _normalizeBaseUrl(String url) => url.endsWith('/') ? url : '$url/';
  String _normalizePath(String path) =>
      path.startsWith('/') ? path.substring(1) : path;

  String get _baseUrl => 'http://52.14.59.145/en';

  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.get(
      path,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    dynamic headers,
  }) async {
    final response = await _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: headers != null ? Options(headers: headers) : null,
    );
    return response.data;
  }

  Future<dynamic> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    dynamic headers,
  }) async {
    final response = await _dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: headers != null ? Options(headers: headers) : null,
    );
    return response.data;
  }

  Future<dynamic> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    dynamic headers,
  }) async {
    final response = await _dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: headers != null ? Options(headers: headers) : null,
    );
    return response.data;
  }

  Future<void> _unauthorizedHandler() async {
    final userId = Application.authBloc.state.userToken?.user.id;
    if (userId == null || _errorDialogShowed) return;
    _errorDialogShowed = true;
    await DialogHelper.showAnimatedDialog(
      pageBuilder: (context, _, __) {
        return ErrorMessageDialog(
          message: S.of(context).error_unauthorized,
        );
      },
    );
    _errorDialogShowed = false;
    Application.authRepo.clearCurrentUserCache(userId);
  }

  void _badrequestHandler(dynamic data) {
    if (data is Map<String, dynamic> && data['Error']?.isNotEmpty == true) {
      if (data['Error']?.toLowerCase().contains('invalid_grant')) {
        _unauthorizedHandler();
      } else if (data['Code']?.isNotEmpty == true) {
        if (!_errorDialogShowed) {
          _errorDialogShowed = true;
          DialogHelper.showAnimatedDialog(
            pageBuilder: (context, _, __) {
              return ErrorMessageDialog(
                message: data['Error'],
              );
            },
          ).then((value) => _errorDialogShowed = false);
        }
      }
    }
  }
  
}
