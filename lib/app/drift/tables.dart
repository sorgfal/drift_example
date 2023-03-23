import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'tables.g.dart';

@UseRowClass(Task, constructor: 'fromDB', generateInsertable: true)
class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  BoolColumn get isDone => boolean()();
}

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

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(tables: [Tasks])
class TasksDatabase extends _$TasksDatabase {
  TasksDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> addTask({required String title}) async {
    await into(tasks).insert(TasksCompanion.insert(name: title, isDone: false));
  }

  Stream<List<Task>> watchCurrentTasks() {
    return select(tasks).watch();
  }

  Future<List<Task>> getTasks() {
    return select(tasks).get();
  }
}
