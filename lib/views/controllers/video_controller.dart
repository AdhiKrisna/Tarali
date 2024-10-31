import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController{
  late VideoPlayerController videoController;
  late ChewieController chewieController;
  String url = "";

  VideoController(this.url);

  @override
  void onInit(){
    super.onInit();
    initializePlayer();
  }

  @override
  void onClose() {
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
      materialProgressColors: ChewieProgressColors(
        playedColor: lightBlue,
        bufferedColor: Colors.white,
        backgroundColor: Colors.white.withOpacity(0.3),
      ),
      cupertinoProgressColors: ChewieProgressColors(
        playedColor: lightBlue,
        bufferedColor: Colors.white,
        backgroundColor: Colors.white.withOpacity(0.3),
      ),
    );
    update();
  }
}