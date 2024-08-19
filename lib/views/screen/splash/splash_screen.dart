import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/views/screen/splash/controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController splashController = Get.put(SplashController());
    return Scaffold(
      body: Center(
        child: Obx(
          () => AnimatedOpacity(
            duration: const Duration(seconds: 2),
            opacity: splashController.opacity.value,
            child:  Image(
              image: const AssetImage('assets/images/splash_logo.jpg'),
              width: MediaQuery.of(context).size.width * 0.6,

              height: MediaQuery.of(context).size.height * 0.4,
            ),
          ),
        ),
      ),  
    );
  }
}
