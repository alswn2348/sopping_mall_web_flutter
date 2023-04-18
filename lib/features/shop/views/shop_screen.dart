import 'package:e_commerce_flutter/constants/gaps.dart';
import 'package:e_commerce_flutter/constants/sizes.dart';
import 'package:e_commerce_flutter/features/shop/logic/models/product.dart';
import 'package:e_commerce_flutter/features/shop/logic/view_model/product_post_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatefulWidget {
  static const String routeName = 'shop';
  static const String routeURL = '/shop';
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
    products = await context.read<ProductPostViewModel>().updateItem();
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
                    onTap: () => _onItemTap(),
                    child: Column(
                      children: [
                        Image.network(
                          "https://source.unsplash.com/random/200x${355 + index}",
                          width: 200,
                          height: 200,
                        ),
                        Gaps.v10,
                        Text(
                          products[index].name,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Gaps.v10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              products[index].price.toString(),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              " ₩",
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
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

  void _onItemTap() {}

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
