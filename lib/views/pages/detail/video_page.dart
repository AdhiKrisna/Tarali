import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/constants/constant_text_style.dart';
import 'package:tarali/views/widgets/background_widget.dart';
import 'package:video_player/video_player.dart';


class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  var argument = Get.arguments;
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  initState(){
    super.initState();
    initializePlayer();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(argument['videoUrl']),
    );
    await _videoPlayerController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
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
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _chewieController?.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String url = argument != null ? argument['videoUrl'] ?? '' : '';
    final String title = argument != null ? argument['title'] ?? 'No Title' : 'No Title';
    return WillPopScope(
      onWillPop: ()async {
        if (_chewieController != null && _chewieController!.isFullScreen) {
          _chewieController!.exitFullScreen();
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: white,
        body: BackgroundWidget.setMainBackground(
          context: context,
          padding: 0,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.black,
                          size: 25,
                        ),
                      ),
                      Text(
                        title,
                        style: PoppinsStyle.stylePoppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  if (url.isNotEmpty) ...[
                    Expanded(
                      child: _videoPlayerController.value.isInitialized && _chewieController != null
                          ? AspectRatio(
                        aspectRatio: _videoPlayerController.value.aspectRatio,
                        child: Chewie(controller: _chewieController!),
                      )
                          : const Center(child: CircularProgressIndicator()),
                    ),
                  ] else ...[
                    const Center(child: Text("Video URL is not available")),
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
