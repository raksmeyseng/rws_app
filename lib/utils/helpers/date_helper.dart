import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/core/enum/language_enum.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rws_app/constants/app_constant.dart';

class DateHelper {
  static DateTime calendarFirstDate() {
    final today = DateTime.now();
    return DateTime(today.year - 100, 1, 1);
  }

  static DateTime calendarLastDate() {
    return DateTime.now();
  }

  static String? formatDate(
    DateTime? date, [
    String pattern = AppConstant.normalDateFormat,
    Locale? locale,
  ]) {
    if (date == null) return null;
    final language = Application.appBloc.state.language;
    final userLocale = language.getLocale();
    final loc = locale?.toString() ?? userLocale.toString();
    final formatedDate = DateFormat(pattern, loc).format(date);
    final splits = formatedDate.trim().split(' ');
    if (['AM', 'PM'].contains(splits.last)) {
      splits[splits.length - 1] = splits.last
          .replaceAll('AM', S.current.time_am)
          .replaceAll('PM', S.current.time_pm);
      return splits.join(' ');
    }
    return formatedDate;
  }

  /// Return pair of quarter as array
  /// Index 0 => start month
  /// Index 1 => end month
  static List<DateTime> getQuarterPair(DateTime date) {
    final pairs = [
      [1, 3],
      [4, 6],
      [7, 9],
      [10, 12]
    ];
    final months =
        pairs.firstWhere((p) => date.month >= p[0] && date.month <= p[1]);
    return [
      DateTime(date.year, months.first),
      DateTime(date.year, months.last)
    ];
  }

  /// Checks if two DateTime objects are the same day.
  /// Returns `false` if either of them is null.
  static bool isSameDay(DateTime? a, DateTime? b) {
    if (a == null || b == null) {
      return false;
    }

    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
