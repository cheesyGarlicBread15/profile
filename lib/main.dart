import 'package:flutter/material.dart';
import 'package:profile/routes.dart';
import 'package:profile/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      initialRoute: '/',
      onGenerateRoute: AppRoutes.onGenerateRoute,
      routes: {
        '/home': (context) => HomeScreen()
      },
    );
  }
}
