import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AudioService extends GetxService with WidgetsBindingObserver  {
  late AudioPlayer audioPlayer;

   @override
  void onInit() {
    super.onInit();

    WidgetsBinding.instance.addObserver(this);

    audioPlayer = AudioPlayer();

    // Atur AudioContext agar audio otomatis pause saat ada interupsi
    audioPlayer.setAudioContext(AudioContext(
      android: const AudioContextAndroid(
      isSpeakerphoneOn: false,
      stayAwake: true,
      contentType: AndroidContentType.music,
      usageType: AndroidUsageType.media,
      audioFocus: AndroidAudioFocus.gainTransient,
      ),
    ));

    audioPlayer.onPlayerStateChanged.listen((state) {
      if (state == PlayerState.completed) {
      audioPlayer.stop();
      }
    }); 
    }

    // Deteksi perubahan status lifecycle
    @override
    void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      // Pause audio ketika aplikasi dikirim ke background
      pause();
    } else if (state == AppLifecycleState.resumed) {
      // Jangan resume audio secara otomatis saat aplikasi kembali aktif
    }
  }

  Future<void> play(String assetPath) async {
    if (audioPlayer.state != PlayerState.playing) {
      await audioPlayer.play(AssetSource(assetPath));
    }
  }

  Future<void> pause() async {
    if (audioPlayer.state == PlayerState.playing) {
      await audioPlayer.pause();
    }
  }

  Future<void> resume() async {
    if (audioPlayer.state == PlayerState.paused) {
      await audioPlayer.resume();
    }
  }

  Future<void> stop() async {
    await audioPlayer.stop();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    audioPlayer.dispose();
    super.onClose();
  }
}
