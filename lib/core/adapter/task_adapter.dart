import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/model/task.dart';

import '../../features/convert_string_to_level.dart';
import '../../features/time_of_day_convertor.dart';

class TaskAdapter extends TypeAdapter<Task> {
  @override
  Task read(BinaryReader reader) {
    return Task(
        id: reader.readString(),
        title: reader.readString(),
        note: reader.readString(),
        date: DateTime.parse(reader.readString()),
        startTime: stringToTimeOfDay(reader.readString()),
        endTime: stringToTimeOfDay(reader.readString()),
        level: convertStringToLevel(reader.readString()),
        isCompleted: reader.readBool());
  }

  @override
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, Task obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.title);
    writer.writeString(obj.note);
    writer.writeString(obj.date.toString());
    writer.writeString(timeOfDayToString(obj.startTime));
    writer.writeString(timeOfDayToString(obj.endTime));
    writer.writeString(obj.level.toString());
    writer.writeBool(obj.isCompleted);
  }
}
