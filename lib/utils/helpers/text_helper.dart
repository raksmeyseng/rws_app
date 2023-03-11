import 'package:rws_app/utils/common_utils.dart';

class TextHelper {
  static String securePhone(String? phone) {
    try {
      if (phone == null) return '';
      final rawPhone = phone.replaceAll(' ', '');
      if (rawPhone.length < 9) return phone;

      final firstThreeDigit = rawPhone.substring(0, 3);
      final lastTwoDigits = rawPhone.substring(rawPhone.length - 2);
      final star = List.generate(rawPhone.length - 5, (index) {
        return '*';
      }).join();
      final result = '$firstThreeDigit $star $lastTwoDigits';
      return phoneBeautify(result);
    } catch (e) {
      return '-';
    }
  }
}
