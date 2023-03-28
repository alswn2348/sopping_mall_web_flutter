import 'package:flutter/material.dart';

class NavigationTap extends StatelessWidget {
  const NavigationTap({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final bool isSelected;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: AnimatedOpacity(
        opacity: isSelected ? 0.3 : 1,
        duration: const Duration(milliseconds: 400),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
