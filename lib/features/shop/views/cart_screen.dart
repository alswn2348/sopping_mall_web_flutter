import 'package:e_commerce_flutter/constants/gaps.dart';
import 'package:e_commerce_flutter/constants/sizes.dart';
import 'package:e_commerce_flutter/features/shop/views/widgets/cart_item.dart';
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
        padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 200.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "BASKET",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Gaps.v10,
                Container(
                  height: Sizes.size1,
                  width: 600,
                  color: Colors.black26,
                ),
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
            )
          ],
        ),
      ),
    );
  }
}
