import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/constants/api_path.dart';
import 'package:rws_app/constants/app_constant.dart';
import 'package:rws_app/core/enum/internet_status_enum.dart';
import 'package:rws_app/core/enum/language_enum.dart';
import 'package:rws_app/core/modules/authentication/bloc/auth_bloc.dart';
import 'package:rws_app/core/modules/authentication/models/refresh_token_payload_model.dart';
import 'package:rws_app/core/modules/authentication/models/user_token_model.dart';
import 'package:rws_app/core/widgets/dialogs/alert_message_dialog.dart';
import 'package:rws_app/core/widgets/dialogs/error_message_dialog.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:rws_app/utils/helpers/dialog_helper.dart';
import 'package:rws_app/utils/helpers/loading_helper.dart';
import 'package:rws_app/utils/helpers/network_helper.dart';
import 'package:flutter/material.dart';

class RestApiService {
  static bool _errorDialogShowed = false;
  final Dio _dio = Dio();
  final String baseUrl = 'http://52.14.59.145/en/api/';

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
          final appBloc = Application.appBloc;
          final authBloc = Application.authBloc;
          final oldUserToken = authBloc.state.userToken;
          final expire = oldUserToken?.tokenExpireTime;
          final now = DateTime.now().add(const Duration(minutes: 10));
          final expired = expire?.isBefore(now) == true;
          if (expired) {
            inspect('Refresh Token Started');
            final securityUrl = _normalizeBaseUrl(baseUrl);
            final path = _normalizePath(ApiPath.refreshToken);
            final options = BaseOptions(baseUrl: securityUrl);
            final payload = RefreshTokenPayloadModel(
              clientId: AppConstant.clientId,
              refreshToken: oldUserToken!.refreshToken,
            );
            try {
              final res = await Dio(options).post(path, data: payload);
              if (res.statusCode == 200) {
                inspect('Refresh Token Successful');
                final newUserToken = UserTokenModel.fromJson(res.data);
                authBloc.add(UserTokenUpdated(newUserToken));
                // Add some delay to wait for auth state finishing updated
                await Future.delayed(const Duration(milliseconds: 300));

                await authBloc.authRepo.saveActiveUserToken(newUserToken);
                // final phone = res.data['userInfo']['phoneNumber'];
                // await authBloc.authRepo
                //     .saveOrUpdateUserTokens(phone, newUserToken);
              } else {
                throw DioError(
                  requestOptions: res.requestOptions,
                  response: res,
                );
              }
            } catch (e) {
              inspect('Refresh Token Failed');
              return handler.reject(e as DioError, true);
            }
          }

          final base64Username =
              base64.encode(utf8.encode(authBloc.state.user?.fullName ?? '--'));

          options.baseUrl = _normalizeBaseUrl(_baseUrl);
          options.path = _normalizePath(options.path);
          options.headers['Lang'] =
              appBloc.state.language.getLocale().languageCode;
          options.headers['X-UserName'] = base64Username;
          options.headers['X-RefreshToken'] =
              authBloc.state.userToken?.refreshToken;
          options.headers['Authorization'] =
              'Bearer ${authBloc.state.userToken?.token}';
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

  String get _baseUrl => '';

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
    final userId = Application.authBloc.state.userToken?.userId;
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
