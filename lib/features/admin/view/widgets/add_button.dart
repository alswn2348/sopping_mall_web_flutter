import 'package:e_commerce_flutter/constants/color.dart';
import 'package:e_commerce_flutter/constants/gaps.dart';
import 'package:e_commerce_flutter/constants/sizes.dart';
import 'package:e_commerce_flutter/features/shop/logic/models/product.dart';
import 'package:e_commerce_flutter/features/shop/logic/view_model/product_post_vm.dart';
import 'package:e_commerce_flutter/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AdminColor.primary,
      child: ElevatedButton.icon(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size18, vertical: Sizes.size12),
        ),
        onPressed: () => _onPressedAdd(context),
        icon: const Icon(Icons.add),
        label: const Text("Add New"),
      ),
    );
  }

  void _onPressedAdd(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    Product formData = Product(
      imgPath: "",
      name: "",
      price: 0,
    );

    void onCheckTap() {
      void addProduct() {
        context.read<ProductPostViewModel>().addItem(formData);
      }

      if (formKey.currentState != null) {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          addProduct();
          Navigator.of(context).pop();
        }
      }
    }

    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          color: AdminColor.secondary,
          padding: const EdgeInsets.all(50),
          child: Form(
            key: formKey,
            child: SizedBox(
              height: 300,
              width: 500,
              child: Column(
                children: [
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Plase write your name";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      if (newValue != null) {
                        formData.name = newValue;
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: 'name',
                      hintStyle: TextStyle(color: Colors.white54),
                    ),
                  ),
                  Gaps.v16,
                  Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return "Plase write your imgpath";
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            if (newValue != null) {
                              formData.imgPath = newValue;
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: 'imgPath',
                            hintStyle: TextStyle(color: Colors.white54),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.image,
                            color: Colors.white,
                          ))
                    ],
                  ),
                  Gaps.v16,
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value != null && !isDigit(value)) {
                        return "Plase write your price";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      if (newValue != null) {
                        formData.price = int.parse(newValue);
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: 'price',
                      hintStyle: TextStyle(color: Colors.white54),
                    ),
                  ),
                  Gaps.v16,
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Plase write your content";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      if (newValue != null) {
                        formData.content = newValue;
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: 'content',
                      hintStyle: TextStyle(color: Colors.white54),
                    ),
                  ),
                  Gaps.v16,
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.size28, vertical: Sizes.size20),
                    ),
                    onPressed: () => onCheckTap(),
                    child: const Text("추가"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
