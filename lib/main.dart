import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:profile/firebase_options.dart';
import 'package:profile/routes.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Profile',
        initialRoute: '/',
        onGenerateRoute: AppRoutes.onGenerateRoute,
        theme: ThemeData(
          primaryColor: const Color(0xFFFF5757), // Main red color
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFFFF5757),
            secondary: const Color(0xFFFF914D), // Orange as secondary
          ),
          scaffoldBackgroundColor:
              const Color(0xFFF8F8F8), // Light gray background
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFFF5757),
            foregroundColor: Colors.white,
            elevation: 2,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF5757),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              elevation: 5,
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(color: Color(0xFF333333)), // Dark gray text
            prefixIconColor: Color(0xFFFF5757), // Red icons
            fillColor: Color(0xFFD9D9D9), // Grayish background for text fields
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide.none, // Remove default border
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color(0xFFFF914D), width: 2), // Orange when focused
            ),
          ),
        ));
  }
}
