import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class DialogModalRoute<T extends PageInfo<dynamic>> extends CustomRoute {
  DialogModalRoute({required T page, String? path})
      : super(
          page: page,
          path: path,
          customRouteBuilder: dialogRouteBuilder,
        );

  // must be static and public
  static Route<T> dialogRouteBuilder<T>(
    BuildContext context,
    Widget child,
    Page<T> page,
  ) {
    // DialogRoute is coming from flutter material
    return DialogRoute<T>(
      context: context,
      settings: page, // must assign page to settings
      builder: (context) => child,
    );
  }
}
