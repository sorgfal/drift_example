import 'package:auto_route/auto_route.dart';
import 'package:drift_example/app/ui/dialog/custom_sheet_dialog.dart';

import 'package:drift_example/tasks/bloc/tasks_list_bloc.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TaskCreationSheet extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  final TasksListBloc bloc;
  TaskCreationSheet({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return CustomSheetDialog(
      children: [
        TextField(
          controller: controller,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), hintText: 'Название дела'),
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
            onPressed: () {
              bloc.add(TasksListEvent.create(controller.text));
              context.popRoute();
            },
            child: const Text('Создать'))
      ],
    );
  }
}
