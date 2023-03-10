import 'package:intl/intl.dart';

extension TimeFormat on DateTime {
  /// Format dateTime
  String format(bool is12hr) {
    var formatToReadable = is12hr ? DateFormat('h:mm a') : DateFormat('HH:mm');
    return formatToReadable.format(this);
  }
}

class DateAndTime {
  /// check if input date is in this month
  static bool isSameMonthFromMillis(int millis) {
    var savedMonth = DateTime.fromMillisecondsSinceEpoch(millis).month;

    var currentMonth = DateTime.now().month;
    return savedMonth == currentMonth;
  }

  /// Accept month in integer, for eg: 7 (for July) etc.
  static bool isSameMonthFromM(int? month) {
    return month == DateTime.now().month;
  }

  /// Accept year in int, for eg: 2021
  static bool isTheSameYear(int? year) {
    return year == DateTime.now().year;
  }

  ///Convert int month to month name
  static String monthName(int month, String locale) {
    // The year doesnt matter kot
    return DateFormat("MMMM", locale).format(DateTime(2021, month));
  }

  static DateTime nightOneThird(DateTime maghrib, DateTime subuh) {
    subuh = subuh.add(const Duration(days: 1));

    var difference = subuh.difference(maghrib);
    var oneThirdDifference = difference.inMinutes ~/ 3;

    // sepertiga akhir malam
    return subuh.subtract(Duration(minutes: oneThirdDifference));
  }
}