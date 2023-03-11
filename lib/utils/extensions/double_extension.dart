import 'package:rws_app/constants/app_constant.dart';
import 'package:intl/intl.dart';

extension DoubleExtension on double {
  String format([String pattern = AppConstant.noneDecimalFormat]) {
    try {
      return NumberFormat(pattern, 'en').format(this);
    } catch (e) {
      return NumberFormat(AppConstant.noneDecimalFormat, 'en').format(this);
    }
  }

  // String get decimalized {
  //   if (kIsWeb) return toString();
  //   return toString().replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "");
  // }

  /// It will eliminate number after decimal point if its value equal to zero.
  ///
  /// Otherwise, it will format the number with 2 decimal points.
  ///
  /// eg. 12.0 => 12, 33.1 => 33.10
  String get decimalized {
    final splits = toStringAsFixed(2).split('.');
    if (double.parse(splits[1]) == .0) {
      return format(AppConstant.noneDecimalFormat);
    }
    return format(AppConstant.decimalFormat);
  }
}
