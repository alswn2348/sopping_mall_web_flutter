import 'package:e_commerce_flutter/constants/color.dart';
import 'package:e_commerce_flutter/constants/sizes.dart';
import 'package:e_commerce_flutter/features/admin/view/widgets/product_list.dart';
import 'package:flutter/material.dart';

class ProductManagementScreen extends StatelessWidget {
  const ProductManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AdminColor.bg,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(Sizes.size40),
          child: ProductList(),
        ),
      ),
    );
  }
}
