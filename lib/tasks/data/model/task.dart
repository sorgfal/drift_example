class Task {
  final int id;
  final String name;
  final bool isDone;
  const Task(this.id, this.name, this.isDone);
  Task.fromDB({
    required this.id,
    required this.name,
    required this.isDone,
  });
}
