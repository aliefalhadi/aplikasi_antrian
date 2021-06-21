import 'package:aplikasi_antrian/configs/constants/app_router_strings.dart';
import 'package:aplikasi_antrian/presentations/views/auth/register_view.dart';
import 'package:flutter/material.dart';

class AppRouter {

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRouterStrings.register:
        return MaterialPageRoute(builder: (_) => RegisterView());
        break;
      default:
        return null;
    }
  }
}