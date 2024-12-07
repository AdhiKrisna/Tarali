import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/views/controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController splashController = Get.put(SplashController());
    return Scaffold(
      body: Center(
        child: Obx(
          () => AnimatedOpacity(
            duration: const Duration(milliseconds: 1500),
            opacity: splashController.opacity.value,
            child: const Image(
              image: AssetImage('assets/images/splash_screen.jpg'),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
