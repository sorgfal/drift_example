import 'dart:async';

import 'package:drift_example/app/drift/tables.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'tasks_list_bloc.freezed.dart';

class TasksListBloc extends Bloc<TasksListEvent, TasksListState> {
  final TasksDatabase tasksDatabase;

  StreamSubscription? tasksSubscription;

  TasksListBloc(this.tasksDatabase) : super(Loading()) {
    on<Init>((event, emit) async {
      var tasks = await tasksDatabase.getTasks();
      emit(Loaded(tasks));

      tasksSubscription = tasksDatabase.watchCurrentTasks().listen((tasks) {
        add(Updated(tasks));
      });
    });
    on<Updated>((event, emit) {
      emit(Loaded(event.tasks));
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
  const factory TasksListEvent.updated(List<Task> tasks) = Updated;
}
