import 'package:intl/intl.dart';

String getFormattedDate(String dateTimeString) {
  DateTime parsedDate = DateTime.parse(dateTimeString);
  return DateFormat('E, ddMMM h a').format(parsedDate).toLowerCase();
}
