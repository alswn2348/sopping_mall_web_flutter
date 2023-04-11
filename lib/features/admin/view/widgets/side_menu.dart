import 'package:e_commerce_flutter/constants/color.dart';
import 'package:e_commerce_flutter/constants/gaps.dart';
import 'package:e_commerce_flutter/constants/sizes.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        Sizes.size16,
      ),
      color: AdminColor.secondary,
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(
              Sizes.size80,
            ),
            child: const Text(
              "admin",
              style: TextStyle(
                color: Colors.white,
                fontSize: Sizes.size28,
              ),
            ),
          ),
          SideMenuListTile(
            isSelected: false,
            title: "Dashboard",
            icon: Icons.dashboard,
            press: () {},
          ),
          Gaps.v32,
          SideMenuListTile(
            isSelected: true,
            title: "product management",
            icon: Icons.cloud_upload,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class SideMenuListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function press;
  final bool isSelected;

  const SideMenuListTile({
    required this.title,
    required this.icon,
    required this.press,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => press(),
      horizontalTitleGap: 20,
      leading: Icon(
        icon,
        color: isSelected ? Colors.white : Colors.white54,
        size: Sizes.size40,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.white54,
          fontSize: Sizes.size20,
        ),
      ),
    );
  }
}
