import 'package:get/get.dart';
import 'dart:async';

import 'package:tarali/routes/route_name.dart';

class EntryController extends GetxController {
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
    Timer(const Duration(milliseconds: 5000), () {
      opacity.value = 0.0;
    });
    Timer(const Duration(milliseconds: 6000), () {
      Get.offNamed(RouteName.dashboard);
    });
  }
}
