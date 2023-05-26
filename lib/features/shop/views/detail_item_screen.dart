import 'package:e_commerce_flutter/constants/gaps.dart';
import 'package:e_commerce_flutter/constants/sizes.dart';
import 'package:e_commerce_flutter/features/authentication/views/widgets/form_button.dart';
import 'package:e_commerce_flutter/features/services/api_service.dart';
import 'package:e_commerce_flutter/features/shop/logic/models/product.dart';
import 'package:e_commerce_flutter/features/shop/logic/view_model/product_post_vm.dart';
import 'package:e_commerce_flutter/features/shop/views/widgets/size_dropdown_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailItemScreen extends StatefulWidget {
  final String itemId;

  const DetailItemScreen({
    super.key,
    required this.itemId,
  });

  @override
  State<DetailItemScreen> createState() => _DetailItemScreenState();
}

class _DetailItemScreenState extends State<DetailItemScreen> {
  final TextEditingController _textController = TextEditingController();
  Product item = Product(
    imgPath: "",
    name: "",
    id: 0,
    content: "",
    price: 0,
  );
  @override
  void initState() {
    super.initState();
    _textController.text = "1";
    initItem();
  }

  void initItem() async {
    if (widget.itemId != "0") {
      item = await context.read<ProductPostViewModel>().getItem(widget.itemId);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: 150,
            vertical: Sizes.size96,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v32,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        "${ApiService.baseUri}/${item.imgPath}",
                        width: 550,
                        height: 500,
                        fit: BoxFit.scaleDown,
                      ),
                      Gaps.v20,
                      Text(
                        item.content!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Gaps.v20,
                      Text(
                        "${item.price} ₩",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Gaps.v24,
                      Text(
                        "Taille/Size",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Gaps.v4,
                      const SizeDropdownMenu(),
                      Gaps.v24,
                      Text(
                        "Quantity",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Gaps.v4,
                      SizedBox(
                        height: Sizes.size32,
                        width: Sizes.size80,
                        child: TextField(
                          controller: _textController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.zero),
                          ),
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      Gaps.v36,
                      Row(
                        children: [
                          const SizedBox(
                            width: 320,
                            child: FormButton(
                              disabled: false,
                              title: "구매하기",
                            ),
                          ),
                          Gaps.h32,
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                              width: 0.7,
                              color: Colors.black,
                            )),
                            width: 52,
                            height: 52,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.shopping_bag_outlined)),
                          )
                        ],
                      ),
                      Gaps.v40,
                      const Text("Livraison / Shipping"),
                      Gaps.v24,
                      Text(
                        "France :\nStandard gratuite (free) : 2-6 business days\nRapide 6€ : 72h (Colissimo)\n\n\nEurope :\nStandard 14€ : 5-7 business days (Colissimo)\n\n\nMonde / World :\nStandard 24€ : 6-21 business days (Colissimo)\n\n\nChine / China :\nStandard 38€ : 8-14 business days (Colissimo)",
                        style: Theme.of(context).textTheme.titleSmall,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
