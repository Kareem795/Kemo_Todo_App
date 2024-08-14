import 'package:intl/intl.dart';

extension Time_Extension on DateTime {
  String get toformattedDate {
    DateFormat formatter = DateFormat("dd/MM/yyyy");
    return formatter.format(this);
  }

  String get dayName {
    List<String> days = ["sat", "sun", "mon", "tue", "web", "thurs", "fri"];
    return days[weekday - 1];
  }
}
