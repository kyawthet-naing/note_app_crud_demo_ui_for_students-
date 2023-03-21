import 'package:flutter/material.dart';
import 'package:note_crud/pages/home/home.dart';
import 'package:note_crud/pages/splash/splash.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Splash.route:
        return _pageRoute(page: const Splash());

      case Home.route:
        return _pageRoute(page: const Home());

      default:
        return _pageRoute(page: const Splash());
    }
  }

  static MaterialPageRoute _pageRoute({required Widget page}) {
    return MaterialPageRoute(builder: (ctx) => page);
  }
}
