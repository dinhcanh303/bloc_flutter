import 'package:flutter/material.dart';
import 'package:flutter_bloc_todos/routers/app_routes.dart';
import 'package:flutter_bloc_todos/screens/screens.dart';
import 'package:flutter_bloc_todos/screens/tabs_screen.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => TabsScreen(),
            settings: const RouteSettings(name: AppRoutes.tasksScreen));
      case '/recycleBin':
        return MaterialPageRoute(
            builder: (context) => const RecycleBin(),
            settings: const RouteSettings(name: AppRoutes.recycleBinScreen));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
