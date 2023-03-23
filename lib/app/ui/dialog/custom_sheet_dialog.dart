import 'package:flutter/material.dart';

class CustomSheetDialog extends StatelessWidget {
  final EdgeInsets? insetPadding;
  final List<Widget> children;

  const CustomSheetDialog(
      {super.key, required this.children, this.insetPadding});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetAnimationDuration: const Duration(seconds: 0),
        alignment: Alignment.bottomCenter,
        insetPadding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: insetPadding ??
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: children,
              ),
            )
          ],
        ));
  }
}
