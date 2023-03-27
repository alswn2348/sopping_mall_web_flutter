import 'package:e_commerce_flutter/constants/gaps.dart';
import 'package:e_commerce_flutter/constants/sizes.dart';
import 'package:e_commerce_flutter/features/authentication/login_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainNavigatorBar extends StatefulWidget {
  const MainNavigatorBar({
    super.key,
  });

  @override
  State<MainNavigatorBar> createState() => _MainNavigatorBarState();
}

class _MainNavigatorBarState extends State<MainNavigatorBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('SOHPPING MALL', style: Theme.of(context).textTheme.headlineLarge),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Text(
                  'HOME',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Gaps.h32,
                Text(
                  'SHOP',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Gaps.h32,
                Text(
                  'COLLECTIONS',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Gaps.h32,
                Text(
                  'ABOUT',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Gaps.h32,
                Text(
                  'More',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            Row(
              children: [
                GestureDetector(onTap: _onLoginTap, child: const Text('login')),
                Gaps.h32,
                const Icon(
                  Icons.shop,
                  size: Sizes.size36,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  void _onLoginTap() {
    context.push(LoginFormScreen.routeName);
  }
}
