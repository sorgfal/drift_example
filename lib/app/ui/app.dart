import 'package:drift_example/app/injector/injector.dart';
import 'package:drift_example/app/routing/app_router.dart';
import 'package:flutter/material.dart';

class TasksApp extends StatelessWidget {
  final AppRouter appRouter = AppRouter();

  TasksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Injector(
      child: MaterialApp.router(
        routerConfig: appRouter.config(),
      ),
    );
  }
}
