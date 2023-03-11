import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/core/modules/app/bloc/app_bloc.dart';
import 'package:rws_app/core/enum/internet_status_enum.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkHelper {
  static StreamSubscription<InternetConnectionStatus>? _subscription;

  static Future<bool> isNetworkConnected() async {
    if (kIsWeb) {
      final connectivity = await Connectivity().checkConnectivity();
      return connectivity == ConnectivityResult.mobile ||
          connectivity == ConnectivityResult.wifi;
    }
    return InternetConnectionChecker().hasConnection;
  }

  static void subscribe() {
    _subscription = InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          Application.appBloc
              .add(const InternetStatusChanged(InternetStatusEnum.online));
          break;
        case InternetConnectionStatus.disconnected:
          Application.appBloc
              .add(const InternetStatusChanged(InternetStatusEnum.offline));
          break;
      }
    });
  }

  static void unsubscribe() {
    _subscription?.cancel();
  }
}
