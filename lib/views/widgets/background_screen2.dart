import 'package:flutter/material.dart';

class BackgroundScreenWidget2 extends StatelessWidget {
  const BackgroundScreenWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/most_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
