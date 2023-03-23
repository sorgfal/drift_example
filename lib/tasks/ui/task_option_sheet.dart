import 'package:auto_route/auto_route.dart';
import 'package:drift_example/app/drift/tables.dart';
import 'package:drift_example/app/ui/dialog/custom_sheet_dialog.dart';
import 'package:drift_example/tasks/bloc/tasks_list_bloc.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TaskOptionsSheet extends StatelessWidget {
  final Task task;
  final TasksListBloc bloc;
  const TaskOptionsSheet({super.key, required this.task, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return CustomSheetDialog(
      insetPadding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        ListTile(
          onTap: () {
            context.popRoute();
            bloc.add(TasksListEvent.delete(task));
          },
          trailing: Icon(
            Icons.delete,
            color: Theme.of(context).colorScheme.error,
          ),
          title: const Text('Удалить'),
        )
      ],
    );
  }
}
