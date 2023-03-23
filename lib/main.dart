import 'package:e_commerce_flutter/constants/sizes.dart';
import 'package:e_commerce_flutter/features/authentication/login_form_screen.dart';
import 'package:e_commerce_flutter/features/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: Sizes.size56,
            color: Colors.black,
          ),
          headlineLarge: TextStyle(
            fontSize: Sizes.size32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headlineMedium: TextStyle(
            fontSize: Sizes.size18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headlineSmall: TextStyle(
            fontSize: Sizes.size12,
          ),
        ),
      ),
      title: 'shopping mall',
      initialRoute: Homescreen.routeName,
      routes: {
        Homescreen.routeName: (context) => const Homescreen(),
        LoginFormScreen.routeName: (context) => const LoginFormScreen(),
      },
    );
  }
}
