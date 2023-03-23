import 'package:drift/drift.dart';
import 'package:drift_example/app/drift/tables.dart';

class TasksRepository {
  final TasksDatabase database;

  TasksRepository(this.database);

  Future<void> addTask({required String title}) async {
    await database
        .into(database.tasks)
        .insert(TasksCompanion.insert(name: title, isDone: false));
  }

  Future<void> deleteTask(int taskId) async {
    await (database.delete(database.tasks)
          ..where((tbl) => tbl.id.equals(taskId)))
        .go();
  }

  Future<void> updateCheck(
      {required int taskId, required bool isChecked}) async {
    await (database.update(database.tasks)
          ..where((tbl) => tbl.id.equals(taskId)))
        .write(TasksCompanion(isDone: Value(isChecked)));
  }

  Stream<List<Task>> watchCurrentTasks() {
    return database.select(database.tasks).watch();
  }

  Future<List<Task>> getTasks() {
    return database.select(database.tasks).get();
  }
}
