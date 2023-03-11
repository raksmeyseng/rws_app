import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'dart:typed_data';

import 'js_helper.dart';

class JsHelperWeb implements JsHelper {
  @override
  void downloadFile(Uint8List bytes, String fileName) {
    final content = base64Encode(bytes);
    AnchorElement(
        href: 'data:application/octet-stream;charset=utf-16le;base64,$content')
      ..setAttribute('download', fileName)
      ..click();
  }
}

JsHelper getJsHelper() => JsHelperWeb();
