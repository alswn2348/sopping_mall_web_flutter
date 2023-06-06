import 'package:e_commerce_flutter/constants/gaps.dart';
import 'package:e_commerce_flutter/constants/sizes.dart';
import 'package:e_commerce_flutter/features/shop/logic/models/cart_item.dart';
import 'package:e_commerce_flutter/features/shop/logic/view_model/cart_vm.dart';
import 'package:e_commerce_flutter/features/shop/views/widgets/cart_item_card.dart';
import 'package:e_commerce_flutter/features/shop/views/widgets/payer_button.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = 'cart';
  static const String routeURL = ':userId';

  final String userId;

  const CartScreen({
    super.key,
    required this.userId,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> cartItems = [];

  @override
  void initState() {
    // initCartItems();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int totalPrice = context.watch<CartViewModel>().price;

    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 150.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "BASKET",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Gaps.v10,
                binder(width: 650.0),
                Gaps.v10,
                Expanded(
                  child: SizedBox(
                    width: 650,
                    child: AnimatedBuilder(
                        animation: context.watch<CartViewModel>(),
                        builder: (context, child) {
                          cartItems =
                              context.read<CartViewModel>().getCartItems;

                          return ListView.separated(
                            itemBuilder: (context, index) {
                              return CartItemCard(
                                cart: cartItems[index],
                              );
                            },
                            separatorBuilder: (context, index) =>
                                binder(width: 650),
                            itemCount: cartItems.length,
                          );
                        }),
                  ),
                ),
                binder(width: 650.0),
                Gaps.v32,
                Row(
                  children: const [
                    Icon(Icons.local_offer_outlined),
                    Text("Saisir un code promo")
                  ],
                ),
                Gaps.v20,
                Row(
                  children: const [
                    Icon(Icons.description_outlined),
                    Text("Something to say")
                  ],
                )
              ],
            ),
            Gaps.h32,
            SizedBox(
              width: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order Summary",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Gaps.v10,
                  binder(width: 250.0),
                  Gaps.v40,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [const Text("Subtotal"), Text("$totalPrice ₩")],
                  ),
                  Gaps.v16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [Text("Dispatch "), Text("200 ₩")],
                  ),
                  Gaps.v40,
                  binder(width: 250.0),
                  Gaps.v16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "total",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        "${totalPrice + 200}  ₩",
                        style: Theme.of(context).textTheme.titleLarge,
                      )
                    ],
                  ),
                  Gaps.v32,
                  const PayerButton(
                    width: 250.0,
                    borderRadius: false,
                    color: Colors.black,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container binder({required double width}) {
    return Container(
      height: Sizes.size1,
      width: width,
      color: Colors.black26,
    );
  }

  void initCartItems() async {
    cartItems = await context.read<CartViewModel>().updateCartItems();
    setState(() {});
  }
}
