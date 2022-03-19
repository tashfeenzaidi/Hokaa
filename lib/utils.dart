import 'package:intl/intl.dart';

class Utils {
  static String getDate(DateTime dateTime) {
    DateFormat _dateFormat = DateFormat('d MMM y');
    return _dateFormat.format(dateTime);
  }
}
