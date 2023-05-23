import 'package:e_commerce_flutter/constants/gaps.dart';
import 'package:e_commerce_flutter/constants/sizes.dart';
import 'package:e_commerce_flutter/features/authentication/logic/view_model/auth_vm.dart';
import 'package:e_commerce_flutter/features/authentication/views/login_screen.dart';
import 'package:e_commerce_flutter/features/home_screen.dart';
import 'package:e_commerce_flutter/features/main_navigation/navigation_tab.dart';
import 'package:e_commerce_flutter/features/shop/logic/view_model/product_post_vm.dart';
import 'package:e_commerce_flutter/features/shop/views/cart_screen.dart';
import 'package:e_commerce_flutter/features/shop/views/detail_item_screen.dart';
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
    "product-page",
    "cart/:userId",
  ];

  late int _selectedIndex = _tabs.indexOf(widget.tab);

  void _onTap(int index) {
    context.go("/${_tabs[index]}");
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onLoginTap() {
    context.pushNamed(LoginScreen.routeName);
  }

  void _onLogoutTap() {
    context.read<AuthenticartionViewModel>().logout();
    _onTap(0);
  }

  void _onCartTap() {
    context.go("/cart");
    setState(() {
      _selectedIndex = 3;
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
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        Gaps.h32,
                        GestureDetector(
                          onTap: () => _onCartTap(),
                          child: const Icon(
                            Icons.shop,
                            size: Sizes.size20,
                            color: Colors.black,
                          ),
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
              child: AnimatedOpacity(
                opacity: _selectedIndex != 0 ? 0 : 1,
                duration: const Duration(milliseconds: 500),
                child: const Homescreen(),
              ),
            ),
            Offstage(
              offstage: _selectedIndex != 1,
              child: AnimatedOpacity(
                opacity: _selectedIndex != 1 ? 0 : 1,
                duration: const Duration(milliseconds: 500),
                child: const ShopScreen(),
              ),
            ),
            Offstage(
              offstage: _selectedIndex != 2,
              child: AnimatedOpacity(
                opacity: _selectedIndex != 2 ? 0 : 1,
                duration: const Duration(milliseconds: 500),
                child: DetailItemScreen(
                  itemId: context.watch<ProductPostViewModel>().item.name,
                ),
              ),
            ),
            Offstage(
              offstage: _selectedIndex != 3,
              child: AnimatedOpacity(
                opacity: _selectedIndex != 3 ? 0 : 1,
                duration: const Duration(milliseconds: 500),
                child: const CartScreen(
                  userId: "",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
