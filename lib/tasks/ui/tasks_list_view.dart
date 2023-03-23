import 'package:drift_example/app/drift/tables.dart';
import 'package:drift_example/tasks/bloc/tasks_list_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksListBloc, TasksListState>(
      builder: (context, state) {
        return state.map(loading: (state) {
          return TasksListViewLoading();
        }, loaded: (state) {
          if (state.tasks.isEmpty) {
            return TasksListViewEmptyPlaceholder();
          }
          return TasksListViewLoaded(
            tasks: state.tasks,
          );
        });
      },
    );
  }
}

class TasksListViewLoading extends StatelessWidget {
  const TasksListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class TasksListViewLoaded extends StatelessWidget {
  final List<Task> tasks;
  const TasksListViewLoaded({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(tasks[index].name),
        trailing: IconButton(
            onPressed: () {
              context
                  .read<TasksListBloc>()
                  .add(TasksListEvent.switchCheck(tasks[index]));
            },
            icon: Icon(tasks[index].isDone
                ? Icons.check_box_outlined
                : Icons.check_box_outline_blank)),
      ),
    );
  }
}

class TasksListViewEmptyPlaceholder extends StatelessWidget {
  const TasksListViewEmptyPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Нет задач'),
    );
  }
}
