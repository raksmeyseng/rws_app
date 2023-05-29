import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rws_app/constants/app_constant.dart';
import 'package:rws_app/core/modules/app/view/app.dart';
import 'package:rws_app/core/services/local_storage_service.dart';
import 'package:rws_app/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  // Set background color of status bar
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  final wiped =
      await LocalStorageService.instance.getString(AppConstant.dataWipeKey);
  if (wiped != AppConstant.wipeKey) {
    await LocalStorageService.instance.clearAll();
    await LocalStorageService.instance
        .saveString(AppConstant.dataWipeKey, AppConstant.wipeKey);
  }

  Bloc.observer = SimpleBlocObserver();
  runApp(const RwsApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

