import 'package:e_commerce_flutter/constants/gaps.dart';
import 'package:e_commerce_flutter/constants/sizes.dart';
import 'package:e_commerce_flutter/features/main_navigation/main_navigation_screen.dart';
import 'package:e_commerce_flutter/features/shop/logic/models/product.dart';
import 'package:e_commerce_flutter/features/shop/logic/view_model/product_post_vm.dart';
import 'package:e_commerce_flutter/features/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  List<Product> products = [];
  @override
  void initState() {
    super.initState();
    initProducts();
  }

  void initProducts() async {
    products = await context.read<ProductPostViewModel>().updateItems();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(
            top: Sizes.size40,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              menuBar(context),
              SizedBox(
                width: 1000,
                height: 1000,
                child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: Sizes.size10,
                    crossAxisSpacing: Sizes.size10,
                    crossAxisCount: 4,
                    childAspectRatio: 1 / 1.1,
                  ),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => _onItemTap(
                      products[index].id.toString(),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: Image.network(
                            "${ApiService.baseUri}/${products[index].imgPath}",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Gaps.v10,
                        Text(
                          products[index].name,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Gaps.v10,
                        Text(
                          "${products[index].price.toString()} ₩",
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onItemTap(String itemId) async {
    await context.read<ProductPostViewModel>().getItem(itemId);
    if (!mounted) return;
    context.pushNamed(
      MainNavigationScreen.routeName,
      params: {
        "tab": 'product-page',
      },
      queryParams: {"itemId": itemId},
    );
  }

  Widget menuBar(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "SHOP",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Gaps.v20,
        Container(
          height: Sizes.size1,
          width: 230,
          color: Colors.black26,
        ),
        Gaps.v20,
        SizedBox(
          width: 230,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categorie",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                "+",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        Gaps.v20,
        Container(
          height: Sizes.size1,
          width: 230,
          color: Colors.black26,
        ),
        Gaps.v20,
        SizedBox(
          width: 230,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Prix",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                "+",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        Gaps.v20,
        Container(
          height: Sizes.size1,
          width: 230,
          color: Colors.black26,
        ),
      ],
    );
  }
}
