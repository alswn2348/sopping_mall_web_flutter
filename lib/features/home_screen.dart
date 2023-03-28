import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Image.network(
          "https://static.wixstatic.com/media/8c1bd9_9355dea12dde4adda42b5bfc79e23126~mv2.jpg/v1/crop/x_0,y_53,w_2362,h_1555/fill/w_1261,h_830,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/small.jpg",
          width: 1700,
          height: 1000,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
