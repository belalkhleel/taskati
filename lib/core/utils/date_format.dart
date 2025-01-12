import 'package:intl/intl.dart';

String dateFormat(DateTime date) {
  return DateFormat('dd MMMM yyyy').format(date);
}