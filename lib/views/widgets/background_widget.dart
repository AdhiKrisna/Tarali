import 'package:flutter/material.dart';

class BackgroundWidget {
  final double padding = 20;

  static setMainBackground({
    required BuildContext context,
    required Widget child,
    double padding = 20,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(padding),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/most_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: child,
      ),
    );
  }

  static setContentBackground({
    required BuildContext context,
    required Widget child,
    double padding = 20,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/detail_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: child,
      ),
    );
  }

  static setWhiteBackground({
    required BuildContext context,
    required Widget child,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: SafeArea(
        child: child,
      ),
    );
  }

  static setMeruBg({
    required BuildContext context,
    required Widget child,
    double padding = 0,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(padding),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg_meru.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: child,
      ),
    );
  }
}
