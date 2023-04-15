// ignore_for_file: public_member_api_docs, sort_constructors_first
class Task {
  final String id;
  final String taskName;
  final DateTime dueDate;
  final bool isDone;
  Task({
    required this.id,
    required this.taskName,
    required this.dueDate,
    required this.isDone,
  });
}
