import 'package:flutter/material.dart';

class PayerButton extends StatelessWidget {
  final double width;
  final bool? borderRadius;
  final Color? color;

  const PayerButton({
    required this.width,
    this.borderRadius = true,
    super.key,
    this.color = const Color(0xFF388E3C),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(
        horizontal: 50.0,
        vertical: 10.0,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius!
            ? const BorderRadius.horizontal(
                left: Radius.circular(20.0),
                right: Radius.circular(20.0),
              )
            : null,
      ),
      child: const Text(
        "Payer",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
