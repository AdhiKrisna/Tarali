
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/constants/constant_text_style.dart';
import 'package:tarali/views/controllers/video_controller.dart';
import 'package:tarali/views/widgets/background_widget.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    var argument = Get.arguments;
    final String url = argument != null ? argument['videoUrl'] ?? '' : '';
    final String title = argument != null ? argument['title'] ?? 'No Title' : 'No Title';

    return Scaffold(
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
                  GetBuilder(
                    key: ValueKey(url),
                    init: VideoController(url),
                    builder: (c) {
                      return Expanded(
                        child: c.videoController.value.isInitialized
                            ? AspectRatio(
                                aspectRatio: c.videoController.value.aspectRatio,
                                child: Chewie(controller: c.chewieController),
                              )
                            : const Center(child: CircularProgressIndicator()),
                      );
                    },
                  ),
                ] else ...[
                  const Center(child: Text("Video URL is not available")),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
