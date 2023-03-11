import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:rws_app/constants/app_constant.dart';

class SecurityHelper {
  /// Show a dialog to verify user PIN code
  ///
  ///  true -> verified
  ///
  ///  false -> unverified
 

  static String generateMD5(String value) {
    return md5.convert(utf8.encode(value)).toString();
  }

  static String generateHashed(String value) {
    return generateMD5(
      '$value${AppConstant.clientId}${AppConstant.secretKey}',
    );
  }
}
