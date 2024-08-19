import 'package:get/get.dart';
import 'dart:async';

import 'package:tarali/routes/route_name.dart';

class SplashController extends GetxController {
  var opacity = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(milliseconds: 500), () {
      opacity.value = 1.0;
    });

    Timer(const Duration(seconds: 3), () {
      Get.offNamed(RouteName.dashboard);
    });
  }
}