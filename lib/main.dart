import 'package:e_commerce_flutter/constants/sizes.dart';
import 'package:e_commerce_flutter/features/authentication/logic/repository/auth_repository.dart';
import 'package:e_commerce_flutter/features/authentication/logic/view_model/auth_vm.dart';
import 'package:e_commerce_flutter/features/shop/logic/view_model/cart_vm.dart';
import 'package:e_commerce_flutter/features/shop/logic/view_model/product_post_vm.dart';

import 'package:e_commerce_flutter/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  final preferences = await SharedPreferences.getInstance();
  final repository = AuthRepository(preferences);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthenticartionViewModel(repository),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductPostViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        //앱바 테마
        appBarTheme:
            const AppBarTheme(backgroundColor: Colors.white, elevation: 0),

        //텍스트 테마
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: Sizes.size56,
            color: Colors.black,
          ),
          displaySmall: TextStyle(
            fontSize: Sizes.size24,
            fontWeight: FontWeight.bold,
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
          bodyLarge: TextStyle(
            fontSize: Sizes.size28,
          ),
          bodyMedium: TextStyle(
            fontSize: Sizes.size16,
          ),
          bodySmall: TextStyle(
            fontSize: Sizes.size10,
            color: Colors.black,
          ),
          titleLarge: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size20,
          ),
          titleSmall: TextStyle(
            color: Colors.black54,
            fontSize: Sizes.size12,
          ),
        ),
      ),
      title: 'shopping mall',
    );
  }
}
