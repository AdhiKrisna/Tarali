import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController{
  late VideoPlayerController videoController;

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
      Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
    );
    await Future.wait([videoController.initialize()]);
    update();
    videoController.play();
    videoController.setLooping(true);
  }
}