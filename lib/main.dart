import 'package:e_commerce_flutter/features/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      title: 'shopping mall',
      initialRoute: Homescreen.routeName,
      routes: {Homescreen.routeName: (context) => const Homescreen()},
    );
  }
}
