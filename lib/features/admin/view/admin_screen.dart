import 'package:e_commerce_flutter/features/admin/view/product_management_screen.dart';
import 'package:e_commerce_flutter/features/admin/view/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  static const String routeName = 'admin';
  static const String routeURL = '/admin';

  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Expanded(
            flex: 1,
            child: SideMenu(),
          ),
          Expanded(
            flex: 5,
            child: ProductManagementScreen(),
          ),
        ],
      ),
    );
  }
}
