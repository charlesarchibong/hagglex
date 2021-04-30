import 'package:flutter/material.dart';
import 'package:hagglex/core/navigations/route_paths.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.startUpPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: Scaffold(
          body: Center(
            child: Text('Start up view'),
          ),
        ),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
