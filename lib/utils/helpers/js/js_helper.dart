import 'dart:typed_data';
import 'js_helper_stub.dart'
    if (dart.library.io) 'package:rws_app/utils/helpers/js/js_helper_mobile.dart'
    if (dart.library.html) 'package:rws_app/utils/helpers/js/js_helper_web.dart';

abstract class JsHelper {
  void downloadFile(Uint8List byte, String filename);
  factory JsHelper() => getJsHelper();
}
