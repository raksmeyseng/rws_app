import 'dart:typed_data';

import 'js_helper.dart';

class JsHelperMobile implements JsHelper {
  @override
  void downloadFile(Uint8List byte, String filename) {
    throw UnimplementedError();
  }
}

JsHelper getJsHelper() => JsHelperMobile();
