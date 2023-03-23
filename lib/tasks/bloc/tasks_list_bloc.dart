import 'dart:async';

import 'package:drift_example/app/drift/tables.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'tasks_list_bloc.freezed.dart';

class TasksListBloc extends Bloc<TasksListEvent, TasksListState> {
  final TasksDatabase tasksDatabase;

  StreamSubscription? tasksSubscription;

  TasksListBloc(this.tasksDatabase) : super(const Loading()) {
    on<Init>((event, emit) async {
      var tasks = await tasksDatabase.getTasks();
      emit(Loaded(tasks));

      tasksSubscription = tasksDatabase.watchCurrentTasks().listen((tasks) {
        add(Update(tasks));
      });
    });
    on<Update>((event, emit) {
      emit(Loaded(event.tasks));
    });
    on<Create>((event, emit) {
      tasksDatabase.addTask(title: event.title);
    });
    on<Delete>((event, emit) async {
      await tasksDatabase.deleteTask(event.task.id);
    });
    on<SwitchCheck>((event, emit) async {
      await tasksDatabase.updateCheck(
          taskId: event.task.id, isChecked: !event.task.isDone);
    });
  }
  @override
  Future<void> close() async {
    await tasksSubscription?.cancel();
    return super.close();
  }
}

@freezed
class TasksListState with _$TasksListState {
  const factory TasksListState.loading() = Loading;
  const factory TasksListState.loaded(List<Task> tasks) = Loaded;
}

@freezed
class TasksListEvent with _$TasksListEvent {
  const factory TasksListEvent.init() = Init;
  const factory TasksListEvent.update(List<Task> tasks) = Update;
  const factory TasksListEvent.create(String title) = Create;
  const factory TasksListEvent.delete(Task task) = Delete;
  const factory TasksListEvent.switchCheck(
    Task task,
  ) = SwitchCheck;
}
