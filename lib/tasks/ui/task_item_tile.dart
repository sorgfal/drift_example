import 'package:auto_route/auto_route.dart';
import 'package:drift_example/app/drift/tables.dart';
import 'package:drift_example/app/routing/app_router.dart';
import 'package:drift_example/tasks/bloc/tasks_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskItemTile extends StatelessWidget {
  final Task task;
  const TaskItemTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        context.pushRoute(
            TaskOptionsRoute(task: task, bloc: context.read<TasksListBloc>()));
      },
      title: Text(task.name),
      trailing: IconButton(
          onPressed: () {
            context.read<TasksListBloc>().add(TasksListEvent.switchCheck(task));
          },
          icon: Icon(task.isDone
              ? Icons.check_box_outlined
              : Icons.check_box_outline_blank)),
    );
  }
}
