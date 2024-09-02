import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BackgorundWidget {
  static setMainBackground({
    required BuildContext context,
    required Widget child,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/most_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );
  }
}
