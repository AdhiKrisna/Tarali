import 'package:get/get.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:tarali/services/content_service.dart';

class PlayerController extends GetxController {
  Timer? timer;
  var cs = ContentService();
  final String title;
  PlayerController({required this.title});  

  @override
  void onInit() {
    print(title);
    print(removeTitleSpace());
    onPlaying();
    super.onInit();
  }

  final audioPlayer = AudioPlayer();
  RxBool isPlaying = true.obs, isReplay = false.obs;
  RxDouble duration = 0.0.obs; //dalam detik, jadi nanti tambahin algoritma buat convert ke menit:detik ke detik ajah
  RxDouble currentSecond = 0.0.obs;
  String removeTitleSpace() {
    return title.replaceAll(' ', '').toLowerCase();
  }
  Future<void> playAudio() async {
    try {
    String audioUrl = await cs.getAudioUrl(removeTitleSpace());
    print('Playing audio from URL: $audioUrl');
      await audioPlayer.play(UrlSource(audioUrl));
      audioPlayer.onDurationChanged.listen((Duration d) {
        if (d.inSeconds > 0) { 
          print('Duration: ${d.inSeconds} seconds');
          duration.value = d.inSeconds.toDouble(); 
        } 
        else { 
          print('Duration: unknown'); 
        }
      });
      audioPlayer.onPositionChanged.listen((Duration p) {
         if (p.inSeconds <= duration.value) {
          currentSecond.value = p.inSeconds.toDouble();
        }
        else {
          print('Duration: unknown'); 
          currentSecond.value = duration.value;
        }
      });
      isPlaying.value = true;  
    } catch (e) {
      print('Error playing audio: $e');
      isPlaying.value = false;  // Mark as not playing on error
    }
  }

  void togglePlaying() async {
    isPlaying.value = !isPlaying.value;
    if (isPlaying.isTrue) {
      onPlaying();
    } else {
      await audioPlayer.pause();
      timer?.cancel();
    }
  }

  void fastForward() async {
    if (currentSecond.value + 10 < duration.value) {
      currentSecond.value += 10;
      await audioPlayer.seek(Duration(seconds: currentSecond.value.toInt()));
    } else {
      currentSecond.value = duration.value;
      await audioPlayer.seek(Duration(seconds: duration.value.toInt()));
    }
  }

  void fastBackward() async {
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
  }

  void updateSliderValue(double value) async {
    currentSecond.value = value;
    await audioPlayer.seek(Duration(seconds: value.toInt()));
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

  String get durationString {
    int minute = (duration.value / 60).floor();
    int second = (duration.value % 60).floor();
    if (minute < 10) {
      if (second < 10) {
        return '0$minute:0$second';
      }
      return '0$minute:$second';
    }
    return '$minute:$second';
  }

  void onPlaying() async {
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
  }

  void replaying() {
    currentSecond.value = 0;
    isReplay.value = false;
    onPlaying();
  }

  @override
  void onClose() {
    timer?.cancel(); // timer diclose saat controller di dispose
    audioPlayer.dispose();
    super.onClose();
  }
}

