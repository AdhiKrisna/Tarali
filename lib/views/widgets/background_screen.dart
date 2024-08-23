import 'package:flutter/material.dart';
import 'package:tarali/constants/constant_colors.dart';

class BackgroundScreenWidget extends StatelessWidget {
  const BackgroundScreenWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          bgBlue,
          white,
        ], begin: Alignment.topCenter, end: Alignment(0, 0.4)),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(image: AssetImage('assets/images/meru_kiri.png')),
              Image(image: AssetImage('assets/images/meru_kanan.png')),
            ],
          ),
        ],
      ),
    );
  }
}
