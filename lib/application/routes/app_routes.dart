import 'package:flutter/material.dart';
import 'package:website/presentation/pages/error_page.dart';
import 'package:website/presentation/pages/main_page.dart';

class AppRoutes {
  static Route onGeneratorRoue(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/main':
        return MaterialPageRoute(
          builder: (_) => const MainPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorPage(),
        );
    }
  }

  static Route onUnknownRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/error_page':
        return MaterialPageRoute(
          builder: (_) => const ErrorPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorPage(),
        );
    }
  }
}
