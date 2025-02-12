import 'package:flutter/material.dart';
import 'package:profile/screens/home_screen.dart';
import 'package:profile/screens/profile_screen.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings setting) {
    final args = setting.arguments;

    switch (setting.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => HomeScreen());

      case '/profile':
        if (args is Map<String, dynamic>) {
          return MaterialPageRoute(
            builder: (context) => ProfileScreen(data: args),
          );
        }
        return _errorRoute(setting.name);

      default:
        return _errorRoute(setting.name);
    }
  }

  static Route _errorRoute(String? name) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(child: Text('No route defined for $name')),
      ),
    );
  }
}
