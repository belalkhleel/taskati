import 'package:flutter/material.dart';

String timeOfDayToString(TimeOfDay time) {
  return time.hour.toString().padLeft(2, '0') + ':' + time.minute.toString().padLeft(2, '0');
}
TimeOfDay stringToTimeOfDay(String timeString) {
  final parts = timeString.split(':');
  final hour = int.parse(parts[0]);
  final minute = int.parse(parts[1]);
  return TimeOfDay(hour: hour, minute: minute);
}
