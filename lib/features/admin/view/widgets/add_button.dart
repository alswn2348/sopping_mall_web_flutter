import 'package:e_commerce_flutter/constants/color.dart';
import 'package:e_commerce_flutter/constants/sizes.dart';
import 'package:flutter/material.dart';

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
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text("Add New"),
      ),
    );
  }
}
