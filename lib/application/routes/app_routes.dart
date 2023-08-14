import 'package:flutter/material.dart';
import 'package:website/presentation/pages/main_page.dart';

class AppRoutes {
  static Route onGeneratorRoue(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case 'main_page':
        return MaterialPageRoute(
          builder: (_) => const MainPage(),
        );
      default:
        throw Exception('Invalid route ${routeSettings.name}');
    }
  }
}
