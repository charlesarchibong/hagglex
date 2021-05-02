import 'package:flutter/material.dart';
import 'package:hagglex/core/navigations/route_paths.dart';
import 'package:hagglex/features/user/presentation/pages/login_page.dart';
import 'package:hagglex/features/user/presentation/pages/select_country_page.dart';
import 'package:hagglex/features/user/presentation/pages/signup_page.dart';
import 'package:hagglex/features/user/presentation/pages/startup_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.startUpPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: StartupPage(),
      );
    case Routes.loginPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginPage(),
      );
    case Routes.selectCountryPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SelectCountryPage(),
      );
    case Routes.signupPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignupPage(),
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
    builder: (_) => viewToShow,
  );
}
