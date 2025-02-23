import 'package:intl/intl.dart';

class AppUtils {
  static String getFormattedDate(int milliseconds, {bool onlyMonthYear = false}) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(milliseconds);
    return DateFormat(onlyMonthYear ? "MMM yyyy" : "dd MMM yyyy").format(date);
  }
}
