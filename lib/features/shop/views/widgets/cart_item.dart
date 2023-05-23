import 'package:e_commerce_flutter/constants/gaps.dart';
import 'package:e_commerce_flutter/constants/sizes.dart';
import 'package:e_commerce_flutter/features/services/api_service.dart';
import 'package:e_commerce_flutter/features/shop/views/widgets/counter_button.dart';
import 'package:e_commerce_flutter/features/shop/views/widgets/payer_button.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
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
                  "${ApiService.baseUri}/img/1.jpg",
                  fit: BoxFit.fill,
                ),
              ),
              Gaps.h12,
              SizedBox(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("item name"),
                    Gaps.v12,
                    Text("1000 ₩"),
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
                        const CounterButton(),
                        TextButton(
                          onPressed: () {},
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
        Container(
          height: Sizes.size1,
          width: 600,
          color: Colors.black26,
        ),
      ],
    );
  }
}
