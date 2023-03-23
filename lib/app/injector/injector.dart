import 'package:drift_example/app/drift/tables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Injector extends StatelessWidget {
  final Widget child;
  const Injector({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [
      RepositoryProvider(
        create: (context) => TasksDatabase(),
      )
    ], child: child);
  }
}
