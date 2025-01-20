import 'package:flutter/material.dart';

enum Level { green, yellow ,red,}

class Task {
  final String id;
  final String title;
  final String note;
  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
   Level? level;
  final bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.note,
    required this.date,
    required this.startTime,
    required this.endTime,
    this.level,
    required this.isCompleted,
  });

  factory Task.onComplete(Task task) {
    return Task(
      id: task.id,
      title: task.title,
      note:task.note,
      date: task.date,
      startTime: task.startTime,
      endTime: task.endTime,
      level: task.level,
      isCompleted: true,
    );
  }



}
