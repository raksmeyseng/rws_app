import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/translation/generated/l10n.dart';

extension DateTimeExtensions on DateTime {
  /// The ISO 8601 week of year [1..53].
  ///
  /// Algorithm from https://en.wikipedia.org/wiki/ISO_week_date#Algorithms
  int get weekOfYear {
    // Add 3 to always compare with January 4th, which is always in week 1
    // Add 7 to index weeks starting with 1 instead of 0
    final woy = ((ordinalDate - weekday + 10) ~/ 7);

    // If the week number equals zero, it means that the given date belongs to the preceding (week-based) year.
    if (woy == 0) {
      // The 28th of December is always in the last week of the year
      return DateTime(year - 1, 12, 28).weekOfYear;
    }

    // If the week number equals 53, one must check that the date is not actually in week 1 of the following year
    if (woy == 53 &&
        DateTime(year, 1, 1).weekday != DateTime.thursday &&
        DateTime(year, 12, 31).weekday != DateTime.thursday) {
      return 1;
    }

    return woy;
  }

  /// The ordinal date, the number of days since December 31st the previous year.
  ///
  /// January 1st has the ordinal date 1
  ///
  /// December 31st has the ordinal date 365, or 366 in leap years
  int get ordinalDate {
    const offsets = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334];
    return offsets[month - 1] + day + (isLeapYear && month > 2 ? 1 : 0);
  }

  /// True if this date is on a leap year.
  bool get isLeapYear {
    return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
  }

  int get quarterOfYear {
    if (month >= 1 && month <= 3) {
      return 1;
    } else if (month >= 4 && month <= 6) {
      return 2;
    } else if (month >= 7 && month <= 9) {
      return 3;
    } else {
      return 4;
    }
  }

  String toDuration() {
    final context = Application.context!;
    if (isBefore(DateTime.parse('1900-01-01'))) {
      return '';
    }
    var now = DateTime.now();
    var diff = now.difference(this);

    int days = diff.inDays;
    int hours = diff.inHours + days * 24;
    int minutes = diff.inMinutes + hours * 60;
    if (minutes <= 1) {
      return S.of(context).just_now;
    }

    int years = (diff.inDays / 365).floor();
    if (years >= 1) {
      return years == 1
          ? S.of(context).single_year_ago_(years)
          : S.of(context).plural_year_ago_(years);
    }

    int months = (diff.inDays / 30).floor();
    if (months >= 1) {
      return months == 1
          ? S.of(context).single_month_ago_(months)
          : S.of(context).plural_month_ago_(months);
    }

    int weeks = (diff.inDays / 7).floor();
    if (weeks >= 1) {
      return weeks == 1
          ? S.of(context).single_week_ago_(weeks)
          : S.of(context).plural_week_ago_(weeks);
    }
    if (days >= 1) {
      return days == 1
          ? S.of(context).single_day_ago_(days)
          : S.of(context).plural_day_ago_(days);
    }
    if (hours >= 1) {
      return hours == 1
          ? S.of(context).single_hour_ago_(hours)
          : S.of(context).plural_hour_ago_(hours);
    }
    // Only condition left is minutes > 1
    return minutes == 1
        ? S.of(context).single_minute_ago_(minutes)
        : S.of(context).plural_minute_ago_(minutes);
  }
}
