import 'package:e_commerce_flutter/constants/gaps.dart';
import 'package:e_commerce_flutter/constants/sizes.dart';
import 'package:e_commerce_flutter/features/authentication/login_form_screen.dart';
import 'package:e_commerce_flutter/features/home_screen.dart';
import 'package:e_commerce_flutter/features/main_navigation/navigation_tab.dart';
import 'package:e_commerce_flutter/features/shop/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainNavigationScreen extends StatefulWidget {
  static const String routeName = '/';
  const MainNavigationScreen({
    super.key,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 50),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(Sizes.size60),
          child: AppBar(
              title: Text('SOHPPING MALL',
                  style: Theme.of(context).textTheme.headlineLarge),
              actions: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        NavigationTap(
                          isSelected: _selectedIndex == 0,
                          onTap: () => _onTap(0),
                          text: 'HOME',
                        ),
                        Gaps.h32,
                        NavigationTap(
                          isSelected: _selectedIndex == 1,
                          onTap: () => _onTap(1),
                          text: 'SHOP',
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
                        GestureDetector(
                            onTap: _onLoginTap,
                            child: const Text(
                              'login',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: Sizes.size12,
                              ),
                            )),
                        Gaps.h32,
                        const Icon(
                          Icons.shop,
                          size: Sizes.size24,
                          color: Colors.black,
                        ),
                      ],
                    )
                  ],
                ),
              ]),
        ),
        body: Stack(
          children: [
            Offstage(
              offstage: _selectedIndex != 0,
              child: const Homescreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 1,
              child: const ShopScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 2,
              child: const ShopScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 3,
              child: const ShopScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 4,
              child: const ShopScreen(),
            ),
          ],
        ),
      ),
    );
  }

  void _onLoginTap() {
    context.push(LoginFormScreen.routeName);
  }
}
