import 'package:e_commerce_flutter/constants/color.dart';
import 'package:e_commerce_flutter/constants/gaps.dart';
import 'package:e_commerce_flutter/constants/sizes.dart';
import 'package:e_commerce_flutter/features/shop/logic/models/product.dart';
import 'package:e_commerce_flutter/features/shop/logic/view_model/product_post_vm.dart';
import 'package:e_commerce_flutter/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:provider/provider.dart';

enum ButtonType { add, modify }

class EditButton extends StatefulWidget {
  final ButtonType buttonType;
  final int? index;
  final Product? product;

  const EditButton({
    super.key,
    required this.buttonType,
    this.index,
    this.product,
  });

  @override
  State<EditButton> createState() => _EditButtonState();
}

class _EditButtonState extends State<EditButton> {
  final TextEditingController _imgPathTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _imgPathTextController.value = TextEditingValue.empty;
  }

  @override
  void dispose() {
    _imgPathTextController.dispose();
    super.dispose();
  }

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
        icon: widget.buttonType == ButtonType.add
            ? const Icon(Icons.add)
            : const Icon(Icons.edit),
        label: widget.buttonType == ButtonType.add
            ? const Text("Add New")
            : const Text('modify'),
      ),
    );
  }

  void _onPressedAdd(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    MediaInfo? mediaData;

    Product formData = Product(
      imgPath: "",
      name: "",
    );
    if (widget.buttonType == ButtonType.modify) {
      formData = widget.product!;
      _imgPathTextController.value = TextEditingValue(text: formData.imgPath);
    }

    void addProduct() {
      context.read<ProductPostViewModel>().addItem(formData);
    }

    void modifyProduct(int index, Product product) {
      context.read<ProductPostViewModel>().modifyItem(
            index: index,
            data: product,
          );
    }

    void onimageTap() async {
      mediaData = await ImagePickerWeb.getImageInfo;
      if (mediaData != null) {
        _imgPathTextController.value =
            TextEditingValue(text: "img/${mediaData!.fileName!}");
      }
    }

    void onCheckTap() {
      if (formKey.currentState != null) {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          widget.buttonType == ButtonType.add
              ? addProduct()
              : modifyProduct(widget.index!, formData);
          if (mounted && mediaData != null) {
            dynamic fileBytes = mediaData!.data;
            context.read<ProductPostViewModel>().updateImage(
                  fileBytes,
                  mediaData!.fileName!,
                );
          }
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
                    initialValue: formData.name,
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
                          controller: _imgPathTextController,
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
                        onPressed: onimageTap,
                        icon: const Icon(
                          Icons.image,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Gaps.v16,
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    initialValue: widget.buttonType == ButtonType.modify
                        ? formData.price.toString()
                        : "",
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
                    initialValue: formData.content,
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
                    child: widget.buttonType == ButtonType.add
                        ? const Text("추가")
                        : const Text("수정"),
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
