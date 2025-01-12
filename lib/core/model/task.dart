enum  Level{ red, blue, green, yellow }
class Task {
  final String id;
  final String title;
  final String description;
  final String date;
  final String time;
   final Level level;

  Task(this.id,
      this.title,
      this.description,
      this.date,
      this.time,
      this.level);

  factory Task.fromHive(task) {
    return Task(task.id, task.title, task.description, task.date, task.time,
        task.level);
  }
}
