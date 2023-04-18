import 'package:e_commerce_flutter/constants/sizes.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>['Small', 'Medium', 'Large', 'Extra Large'];

class SizeDropdownMenu extends StatefulWidget {
  const SizeDropdownMenu({super.key});

  @override
  State<SizeDropdownMenu> createState() => _SizeDropdownMenuState();
}

class _SizeDropdownMenuState extends State<SizeDropdownMenu> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: Sizes.size40,
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.black,
        width: 0.2,
      )),
      child: DropdownButton<String>(
        isExpanded: true,
        value: dropdownValue,
        icon: const Icon(Icons.keyboard_arrow_down_outlined),
        underline: Container(),
        onChanged: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
