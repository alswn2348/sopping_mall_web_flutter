import 'package:e_commerce_flutter/constants/gaps.dart';
import 'package:e_commerce_flutter/constants/sizes.dart';
import 'package:e_commerce_flutter/features/authentication/logic/view_model/auth_vm.dart';
import 'package:e_commerce_flutter/features/authentication/views/login_screen.dart';
import 'package:e_commerce_flutter/features/home_screen.dart';
import 'package:e_commerce_flutter/features/main_navigation/navigation_tab.dart';
import 'package:e_commerce_flutter/features/shop/views/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MainNavigationScreen extends StatefulWidget {
  static const String routeName = 'mainNavigation';

  final String tab;
  const MainNavigationScreen({super.key, required this.tab});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final List<String> _tabs = [
    "home",
    "shop",
  ];

  late int _selectedIndex = _tabs.indexOf(widget.tab);

  void _onTap(int index) {
    context.go("/${_tabs[index]}");
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
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
                          onTap: context
                                      .watch<AuthenticartionViewModel>()
                                      .updateToken !=
                                  ""
                              ? _onLogoutTap
                              : _onLoginTap,
                          child: Text(
                            context
                                        .watch<AuthenticartionViewModel>()
                                        .updateToken !=
                                    ""
                                ? 'logout'
                                : 'login',
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: Sizes.size12,
                            ),
                          ),
                        ),
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
    context.pushNamed(LoginScreen.routeName);
  }

  void _onLogoutTap() {
    context.read<AuthenticartionViewModel>().logout();
    _onTap(0);
  }
}
