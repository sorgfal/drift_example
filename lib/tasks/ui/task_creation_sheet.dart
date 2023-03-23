import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TaskCreationSheet extends StatelessWidget {
  const TaskCreationSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetAnimationDuration: Duration(seconds: 5),
        alignment: Alignment.bottomCenter,
        insetPadding: EdgeInsets.zero,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            )
          ],
        ));
  }
}
