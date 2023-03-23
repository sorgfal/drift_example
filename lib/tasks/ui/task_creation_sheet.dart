import 'package:auto_route/auto_route.dart';
import 'package:drift_example/tasks/bloc/tasks_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class TaskCreationSheet extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  final TasksListBloc bloc;
  TaskCreationSheet({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetAnimationDuration: Duration(seconds: 0),
        alignment: Alignment.bottomCenter,
        insetPadding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  TextField(
                    controller: controller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Название дела'),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        bloc.add(TasksListEvent.create(controller.text));
                        context.popRoute();
                      },
                      child: Text('Создать'))
                ],
              ),
            )
          ],
        ));
  }
}
