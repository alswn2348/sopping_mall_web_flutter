import 'package:e_commerce_flutter/constants/gaps.dart';
import 'package:e_commerce_flutter/constants/sizes.dart';
import 'package:e_commerce_flutter/features/authentication/views/widgets/form_button.dart';
import 'package:e_commerce_flutter/features/shop/views/widgets/size_dropdown_menu.dart';
import 'package:flutter/material.dart';

class DetailItemScreen extends StatefulWidget {
  static const String routeName = 'detail-product-page';
  static const String routeURL = ':itemId';

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

  @override
  void initState() {
    super.initState();
    _textController.text = "1";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 150,
            vertical: Sizes.size96,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "카테고리/세부카테고리/제품명",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Gaps.v32,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        "https://static.wixstatic.com/media/8c1bd9_7ea6f67e29d44160a562b9a795cc0969~mv2.jpg/v1/fill/w_500,h_500,al_c,q_85,usm_0.66_1.00_0.01/8c1bd9_7ea6f67e29d44160a562b9a795cc0969~mv2.webp",
                        width: 550,
                        height: 500,
                      ),
                      Gaps.v20,
                      Text(
                        "제품 상세 정보 텍스트 ",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "귀한 당근 가방 케이스",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Gaps.v20,
                      Text(
                        "500,000 ₩",
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
