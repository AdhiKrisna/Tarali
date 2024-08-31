import 'package:get/get.dart';
import 'dart:async';

class PlayerController extends GetxController {
  Timer? timer;
  @override
  void onInit() {
    onPlaying();
    super.onInit();
  }
  RxBool isPlaying = true.obs, isReplay = false.obs;

  //anggaplah durationnya 5:36 menit
  RxDouble duration = 336.0.obs; //dalam detik, jadi nanti tambahin algoritma buat convert ke menit:detik ke detik ajah
  RxDouble currentSecond = 0.0.obs;

  void togglePlaying() {
    isPlaying.value = !isPlaying.value;
     if(isPlaying.isTrue){
      onPlaying();
    }else {
      timer?.cancel(); 
    }
  }
  void fastForward(){
    if(currentSecond.value + 10 < duration.value){
      currentSecond.value += 10;
    }else{
      currentSecond.value = duration.value;
    }
  }
  void fastBackward(){
    if(isReplay.isTrue){
      isReplay.value = false;
      onPlaying();
    }
    if(currentSecond.value - 10 > 0){
      currentSecond.value -= 10;
    }else{
      currentSecond.value = 0;
    }
  }
  void updateSliderValue(double value) {
    currentSecond.value = value;
  }
  String get currentSecondString {
    int minute = (currentSecond.value / 60).floor();
    int second = (currentSecond.value % 60).floor();
    if (minute < 10) {
      if (second < 10) {
        return '0$minute:0$second';
      }
      return '0$minute:$second';
    }
    return '$minute:$second';
  }

  void onPlaying() async {
    timer?.cancel(); //biar pasti reset timer
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if(isPlaying.isTrue){
        if (currentSecond.value < duration.value) {
          currentSecond.value ++;
        } else {
          timer.cancel();
          isReplay.value = true;
        }
      }
      else {
        timer.cancel();
      }
    });
  }
  void replaying(){
    currentSecond.value = 0;
    isReplay.value = false;
    onPlaying();
  }

   @override
  void onClose() {
    timer?.cancel(); // Pastikan timer dibatalkan saat controller dihancurkan
    super.onClose();
  }
}
