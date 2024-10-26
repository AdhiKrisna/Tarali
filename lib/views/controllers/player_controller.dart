import 'package:get/get.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:tarali/services/content_service.dart';

class PlayerController extends GetxController {
  Timer? timer;
  var cs = ContentService();
  final String url;
  PlayerController({required this.url});

  @override
  void onInit() {
    super.onInit();
    onPlaying();
  }

  final audioPlayer = AudioPlayer();
  RxBool isPlaying = true.obs, isReplay = false.obs;
  RxDouble duration = 0.0.obs;
  RxDouble currentSecond = 0.0.obs;

  Future<void> playAudio() async {
    try {
      await audioPlayer.play(UrlSource(url));
      Duration? dr = await audioPlayer.getDuration();
      duration.value = dr!.inSeconds.toDouble();
      update();
      audioPlayer.onPositionChanged.listen((Duration p) {
        if (p.inSeconds <= duration.value) {
          currentSecond.value = p.inSeconds.toDouble();
        } else {
          currentSecond.value = duration.value;
        }
      });
      isPlaying.value = true;
    } catch (e) {
      isPlaying.value = false; // Mark as not playing on error
    }
  }

  void togglePlaying() async {
    try {
      isPlaying.value = !isPlaying.value;
      if (isPlaying.isTrue) {
        onPlaying();
      } else {
        await audioPlayer.pause();
        timer?.cancel();
      }
    } catch (e) {
      print(e);
      isPlaying.value = false; // Mark as not playing on error
    }
  }

  void fastForward() async {
    try {
      if (currentSecond.value + 10 < duration.value) {
        currentSecond.value += 10;
        await audioPlayer.seek(Duration(seconds: currentSecond.value.toInt()));
      } else {
        currentSecond.value = duration.value;
        await audioPlayer.seek(Duration(seconds: duration.value.toInt()));
      }
    } catch (e) {
      print(e);
      // Handle error if needed
    }
  }

  void fastBackward() async {
    try {
      if (isReplay.isTrue) {
        isReplay.value = false;
        onPlaying();
      }
      if (currentSecond.value - 10 > 0) {
        currentSecond.value -= 10;
        await audioPlayer.seek(Duration(seconds: currentSecond.value.toInt()));
      } else {
        currentSecond.value = 0;
        await audioPlayer.seek(const Duration(seconds: 0));
      }
    } catch (e) {
      print(e);
      // Handle error if needed
    }
  }

  void updateSliderValue(double value) async {
    try {
      currentSecond.value = value;
      await audioPlayer.seek(Duration(seconds: value.toInt()));
    } catch (e) {
      print(e);
      // Handle error if needed
    }
  }

  String get currentSecondString {
    try {
      int minute = (currentSecond.value / 60).floor();
      int second = (currentSecond.value % 60).floor();
      if (minute < 10) {
        if (second < 10) {
          return '0$minute:0$second';
        }
        return '0$minute:$second';
      }
      return '$minute:$second';
    } catch (e) {
      print(e);
      return '00:00'; // Return default value on error
    }
  }

  String get durationString {
    try {
      int minute = (duration.value / 60).floor();
      int second = (duration.value % 60).floor();
      if (minute < 10) {
        if (second < 10) {
          return '0$minute:0$second';
        }
        return '0$minute:$second';
      }
      return '$minute:$second';
    } catch (e) {
      print(e);
      return '00:00'; // Return default value on error
    }
  }


  void onPlaying() async {
    try {
      await playAudio();
      timer?.cancel(); //biar pasti reset timer
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (isPlaying.isTrue) {
          if (currentSecond.value < duration.value) {
            currentSecond.value++;
          } else {
            timer.cancel();
            isReplay.value = true;
          }
        } else {
          timer.cancel();
        }
      });
    } catch (e) {
      print(e);
      isPlaying.value = false; // Mark as not playing on error
    }
  }

  void replaying() {
    try {
      currentSecond.value = 0;
      isReplay.value = false;
      onPlaying();
    } catch (e) {
      print(e);
      // Handle error if needed
    }
  }

  @override
  void onClose() {
    try {
      timer?.cancel(); // timer diclose saat controller di dispose
      audioPlayer.dispose();
      super.onClose();
    } catch (e) {
      print(e);
      // Handle error if needed
    }
  }
}
