import 'package:e_commerce_flutter/constants/gaps.dart';
import 'package:e_commerce_flutter/constants/sizes.dart';
import 'package:e_commerce_flutter/features/services/api_service.dart';
import 'package:e_commerce_flutter/features/shop/logic/models/cart_item.dart';
import 'package:e_commerce_flutter/features/shop/logic/view_model/cart_vm.dart';
import 'package:e_commerce_flutter/features/shop/views/widgets/counter_button.dart';
import 'package:e_commerce_flutter/features/shop/views/widgets/payer_button.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CartItemCard extends StatelessWidget {
  final CartItem cart;

  const CartItemCard({
    super.key,
    required this.cart,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Sizes.size96,
                height: Sizes.size96,
                child: Image.network(
                  "${ApiService.baseUri}/${cart.item.imgPath}",
                  fit: BoxFit.cover,
                ),
              ),
              Gaps.h12,
              SizedBox(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cart.item.name),
                    Gaps.v12,
                    Text("${cart.item.price} ₩"),
                  ],
                ),
              ),
              SizedBox(
                width: 200,
                height: 100.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CounterButton(
                          counter: cart.count,
                        ),
                        TextButton(
                          onPressed: () => _onDeleteTap(context),
                          child: const Text(
                            "X",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    const PayerButton(
                      width: 150,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  void _onDeleteTap(BuildContext context) async {
    await context.read<CartViewModel>().removeItem(cart.cartId);
  }
}
