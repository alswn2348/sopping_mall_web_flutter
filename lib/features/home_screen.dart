import 'package:e_commerce_flutter/constants/gaps.dart';
import 'package:flutter/material.dart';

import 'main_navigator_bar.dart';

class Homescreen extends StatelessWidget {
  static const String routeName = '/';
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 50),
          child: Column(
            children: const [
              MainNavigatorBar(),
            ],
          ),
        ),
      ),
    );
  }
}
