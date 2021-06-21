import 'package:flutter/material.dart';

class AppRouter {

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // case AppRouterStrings.onboard:
      //   return MaterialPageRoute(builder: (_) => Onboard());
      //   break;
      default:
        return null;
    }
  }
}