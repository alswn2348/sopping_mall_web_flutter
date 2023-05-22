import 'package:e_commerce_flutter/features/authentication/views/login_screen.dart';
import 'package:e_commerce_flutter/features/authentication/views/sign_up_screen.dart';
import 'package:e_commerce_flutter/features/main_navigation/main_navigation_screen.dart';
import 'package:e_commerce_flutter/features/shop/views/cart_screen.dart';
import 'package:e_commerce_flutter/features/shop/views/detail_item_screen.dart';
import 'package:go_router/go_router.dart';

import 'features/admin/view/admin_screen.dart';

final router = GoRouter(
  initialLocation: "/home",
  routes: [
    GoRoute(
        path: "/:tab(home|shop|product-page|cart)",
        name: MainNavigationScreen.routeName,
        builder: (context, state) {
          final tab = state.params["tab"]!;
          return MainNavigationScreen(
            tab: tab,
          );
        },
        routes: [
          GoRoute(
            path: DetailItemScreen.routeURL,
            name: DetailItemScreen.routeName,
            builder: (context, state) {
              final itemId = state.params["itemId"] ?? "";
              return DetailItemScreen(
                itemId: itemId,
              );
            },
          ),
          GoRoute(
            path: CartScreen.routeURL,
            name: CartScreen.routeName,
            builder: (context, state) {
              final userId = state.params["userId"] ?? "";
              return CartScreen(
                userId: userId,
              );
            },
          ),
        ]),
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
      path: AdminScreen.routeURL,
      name: AdminScreen.routeName,
      builder: (context, state) => const AdminScreen(),
    ),
  ],
);
