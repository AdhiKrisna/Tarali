import 'package:get/get.dart';
import 'dart:async';

import 'package:tarali/routes/route_name.dart';

class EntryController extends GetxController {
  var opacity = 0.0.obs;
  void showSplash() {
    Timer(const Duration(milliseconds: 500), () {
      opacity.value = 1.0;
    });
    Timer(const Duration(milliseconds: 4000), () {
      opacity.value = 0.0;
    });
    Timer(const Duration(milliseconds: 5000), () {
      Get.offNamed(RouteName.entry2);
    });
  }

  void showSplash2() {
    Timer(const Duration(milliseconds: 500), () {
      opacity.value = 1.0;
    });
    Timer(const Duration(milliseconds: 3000), () {
      opacity.value = 0.0;
    });
    Timer(const Duration(milliseconds: 3500), () {
      Get.offNamed(RouteName.dashboard);
    });
  }
}
