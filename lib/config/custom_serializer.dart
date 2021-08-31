import 'package:intl/intl.dart';

class CustomSerializer {
  static DateTime stringToDateTime(String date) {
    return DateFormat('dd-MM-yyyy hh:mm:ss').parse(date);
  }
}
