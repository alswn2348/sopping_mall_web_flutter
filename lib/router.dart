import 'package:e_commerce_flutter/features/authentication/views/login_screen.dart';
import 'package:e_commerce_flutter/features/authentication/views/sign_up_screen.dart';
import 'package:e_commerce_flutter/features/main_navigation/main_navigation_screen.dart';
import 'package:go_router/go_router.dart';

import 'features/admin/view/admin_screen.dart';

final router = GoRouter(
  initialLocation: "/home",
  routes: [
    GoRoute(
      path: "/:tab(home|shop|product-page|cart)",
      name: MainNavigationScreen.routeName,
      builder: (context, state) {
        final itemId = state.queryParams["itemId"] ?? "0";
        final tab = state.params["tab"]!;

        return MainNavigationScreen(
          tab: tab,
          itemId: itemId,
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
      path: AdminScreen.routeURL,
      name: AdminScreen.routeName,
      builder: (context, state) => const AdminScreen(),
    ),
  ],
);
