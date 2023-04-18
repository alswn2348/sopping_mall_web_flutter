import 'package:e_commerce_flutter/features/authentication/views/login_screen.dart';
import 'package:e_commerce_flutter/features/authentication/views/sign_up_screen.dart';
import 'package:e_commerce_flutter/features/main_navigation/main_navigation_screen.dart';
import 'package:e_commerce_flutter/features/shop/views/detail_item_screen.dart';
import 'package:e_commerce_flutter/features/shop/views/shop_screen.dart';
import 'package:go_router/go_router.dart';

import 'features/admin/view/admin_screen.dart';

final router = GoRouter(
  initialLocation: DetailItemScreen.routeURL,
  routes: [
    GoRoute(
      path: "/:tab(home|shop|product-page)",
      name: MainNavigationScreen.routeName,
      builder: (context, state) {
        final tab = state.params["tab"]!;
        return MainNavigationScreen(
          tab: tab,
        );
      },
    ),
    GoRoute(
      path: LoginScreen.routeURL,
      name: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: SignUpScreen.routeURL,
      name: SignUpScreen.routeName,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: ShopScreen.routeURL,
      name: ShopScreen.routeName,
      builder: (context, state) => const ShopScreen(),
    ),
    GoRoute(
      path: AdminScreen.routeURL,
      name: AdminScreen.routeName,
      builder: (context, state) => const AdminScreen(),
    ),
    GoRoute(
      path: DetailItemScreen.routeURL,
      name: DetailItemScreen.routeName,
      builder: (context, state) => const DetailItemScreen(),
    ),
  ],
);
