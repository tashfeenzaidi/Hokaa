import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  static String getDate(DateTime dateTime) {
    DateFormat _dateFormat = DateFormat('d MMM y');
    return _dateFormat.format(dateTime);
  }

  static getStatusIcon(int status) {
    // SystemParameterResponse systemParameterResponse = SystemParameterResponse.fromJson(GetStorage().read('systemParameters'));
    switch (status) {
      case 1:
        return Icons.check_circle_sharp;
        break;
      case 5:
        return Icons.cancel;
        break;
      case 3:
        return Icons.check_circle_sharp;
        break;
      case 4:
        return Icons.check_circle_sharp;
        break;
    }
  }

  static getStatusIconColor(int status) {
    switch (status) {
      case 1:
        return Colors.yellowAccent;
        break;
      case 5:
        return Colors.red;
        break;
      case 3:
        return Colors.greenAccent;
        break;
      case 4:
        return Colors.deepOrange;
        break;
    }
  }
}
