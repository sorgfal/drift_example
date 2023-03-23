import 'package:auto_route/auto_route.dart';
import 'package:drift_example/app/drift/tables.dart';
import 'package:drift_example/app/routing/app_router.dart';
import 'package:drift_example/tasks/bloc/tasks_list_bloc.dart';
import 'package:drift_example/tasks/data/tasks_repository.dart';
import 'package:drift_example/tasks/ui/tasks_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            TasksListBloc(TasksRepository(context.read<TasksDatabase>()))
              ..add(const TasksListEvent.init()),
        child: Scaffold(
          floatingActionButton: Builder(builder: (context) {
            return FloatingActionButton(
              onPressed: () => context.pushRoute(
                  TaskCreationRoute(bloc: context.read<TasksListBloc>())),
            );
          }),
          body: const TasksListView(),
        ));
  }
}
