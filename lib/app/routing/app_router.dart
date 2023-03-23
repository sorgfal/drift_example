import 'package:auto_route/auto_route.dart';
import 'package:drift_example/app/routing/dialog_route.dart';
import 'package:drift_example/app/ui/screens/home_screen.dart';
import 'package:drift_example/tasks/ui/task_creation_sheet.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Dialog|Sheet,Route')
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: HomeRoute.page, path: '/'),
    DialogModalRoute(
      page: TaskCreationRoute.page,
      path: '/tasks/create',
    ),
  ];
}
