import 'package:get/get.dart';
import 'dart:async';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/services/music_service.dart';

class SplashController extends GetxController {
  var opacity = 0.0.obs;
  final AudioService audioService = Get.find<AudioService>();
  @override
  void onInit() {
    super.onInit();
    audioService.play('audio/lagu.mp3');
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
