import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController{
  late VideoPlayerController videoController;
  late ChewieController chewieController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initializePlayer();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    videoController.dispose();
  }

  Future<void> initializePlayer() async {
    videoController = VideoPlayerController.networkUrl(
      Uri.parse('https://ia803405.us.archive.org/27/items/archive-video-files/test.mp4'),
    );
    chewieController = ChewieController(
      videoPlayerController: videoController,
      autoPlay: true,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ],
      deviceOrientationsOnEnterFullScreen: [
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ],
    );
    await Future.wait([videoController.initialize()]);
    update();
  }
}