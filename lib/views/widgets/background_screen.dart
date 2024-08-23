import 'package:flutter/material.dart';

class BackgroundScreenWidget extends StatelessWidget {
  const BackgroundScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFFB5EDFE),
          Color(0xFFFFFFFF),
          Color(0xFFFFFFFF),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
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
