class Task {
  final String id;
  late String taskName;
  final DateTime dueDate;
  final bool isDone;
  Task({
    required this.id,
    required this.taskName,
    required this.dueDate,
    required this.isDone,
  });
}
