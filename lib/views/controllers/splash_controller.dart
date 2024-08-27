import 'package:get/get.dart';
import 'dart:async';
import 'package:tarali/routes/route_name.dart';

class SplashController extends GetxController {
  var opacity = 0.0.obs;
  @override
  void onInit() {
    super.onInit();
    showSplash();
  }

  void showSplash() {
    Timer(const Duration(milliseconds: 500), () {
      opacity.value = 1.0;
    });
    Timer(const Duration(milliseconds: 3500), () {
      opacity.value = 0.0;
    });
    Timer(const Duration(milliseconds: 5000), () {
      Get.offNamed(RouteName.dashboard);
    });
  }
}
