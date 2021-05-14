class TaskModel {
  final String taskName;
  final String? details;
  final DateTime? date;
  final List<TaskModel>? subTasks;

  TaskModel({
    required this.taskName,
    this.details,
    this.date,
    this.subTasks,
  });

  int size() {
    return subTasks == null ? 0 : subTasks!.length;
  }
}
