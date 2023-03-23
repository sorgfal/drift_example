// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    TaskCreationRoute.name: (routeData) {
      final args = routeData.argsAs<TaskCreationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TaskCreationSheet(
          key: args.key,
          bloc: args.bloc,
        ),
      );
    },
    TaskOptionsRoute.name: (routeData) {
      final args = routeData.argsAs<TaskOptionsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TaskOptionsSheet(
          key: args.key,
          task: args.task,
          bloc: args.bloc,
        ),
      );
    },
  };
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TaskCreationSheet]
class TaskCreationRoute extends PageRouteInfo<TaskCreationRouteArgs> {
  TaskCreationRoute({
    Key? key,
    required TasksListBloc bloc,
    List<PageRouteInfo>? children,
  }) : super(
          TaskCreationRoute.name,
          args: TaskCreationRouteArgs(
            key: key,
            bloc: bloc,
          ),
          initialChildren: children,
        );

  static const String name = 'TaskCreationRoute';

  static const PageInfo<TaskCreationRouteArgs> page =
      PageInfo<TaskCreationRouteArgs>(name);
}

class TaskCreationRouteArgs {
  const TaskCreationRouteArgs({
    this.key,
    required this.bloc,
  });

  final Key? key;

  final TasksListBloc bloc;

  @override
  String toString() {
    return 'TaskCreationRouteArgs{key: $key, bloc: $bloc}';
  }
}

/// generated route for
/// [TaskOptionsSheet]
class TaskOptionsRoute extends PageRouteInfo<TaskOptionsRouteArgs> {
  TaskOptionsRoute({
    Key? key,
    required dynamic task,
    required TasksListBloc bloc,
    List<PageRouteInfo>? children,
  }) : super(
          TaskOptionsRoute.name,
          args: TaskOptionsRouteArgs(
            key: key,
            task: task,
            bloc: bloc,
          ),
          initialChildren: children,
        );

  static const String name = 'TaskOptionsRoute';

  static const PageInfo<TaskOptionsRouteArgs> page =
      PageInfo<TaskOptionsRouteArgs>(name);
}

class TaskOptionsRouteArgs {
  const TaskOptionsRouteArgs({
    this.key,
    required this.task,
    required this.bloc,
  });

  final Key? key;

  final dynamic task;

  final TasksListBloc bloc;

  @override
  String toString() {
    return 'TaskOptionsRouteArgs{key: $key, task: $task, bloc: $bloc}';
  }
}
