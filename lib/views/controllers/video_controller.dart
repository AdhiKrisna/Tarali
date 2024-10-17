import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController{
  late VideoPlayerController videoController;
  late ChewieController chewieController;
  String url = "";

  VideoController(this.url);

  @override
  void onInit(){
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
      Uri.parse(url),
    );

    await Future.wait([videoController.initialize()]);

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
    update();
  }
}