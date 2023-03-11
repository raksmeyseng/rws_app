import 'package:flutter/foundation.dart';
import 'package:sms_autofill/sms_autofill.dart';

class SmsHelper {
  static Future<String> getAppSignatureAsync() async {
    if (kIsWeb) return '';
    try {
      String signature = await SmsAutoFill().getAppSignature;
      // When signature is null it will catch and return empty string;
      return signature.toString();
    } catch (e) {
      return '';
    }
  }
}
