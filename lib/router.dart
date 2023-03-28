import 'package:e_commerce_flutter/features/authentication/login_form_screen.dart';
import 'package:e_commerce_flutter/features/authentication/sign_up_screen.dart';
import 'package:e_commerce_flutter/features/main_navigation/main_navigation_screen.dart';
import 'package:e_commerce_flutter/features/shop/shop_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => const MainNavigationScreen()),
  GoRoute(
    path: LoginFormScreen.routeName,
    builder: (context, state) => const LoginFormScreen(),
  ),
  GoRoute(
    path: SignUpScreen.routeName,
    builder: (context, state) => const SignUpScreen(),
  ),
  GoRoute(
    path: ShopScreen.routeName,
    builder: (context, state) => const ShopScreen(),
  ),
]);
