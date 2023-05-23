import 'package:e_commerce_flutter/constants/gaps.dart';
import 'package:e_commerce_flutter/constants/sizes.dart';
import 'package:e_commerce_flutter/features/shop/views/widgets/cart_item.dart';
import 'package:e_commerce_flutter/features/shop/views/widgets/payer_button.dart';

import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = 'cart';
  static const String routeURL = ':userId';

  final String userId;

  const CartScreen({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
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
                binder(width: 600.0),
                Gaps.v10,
                const CartItem(),
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
                    children: const [Text("Subtotal"), Text("1000  ₩")],
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
                        "Total",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        "1200  ₩",
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
}
