import 'package:flutter/material.dart';
import '../app.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.home:
        return MaterialPageRoute(
          builder: (_) =>  HomeView(),
        );
    }
    return MaterialPageRoute(
      // builder: (_) => PageNotFound(),
      builder: (_) => const Text(
        'Replace with page not found',
      ),
    );
  }
}