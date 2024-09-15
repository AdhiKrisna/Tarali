import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/views/controllers/video_controller.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: (){
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.black,
                      size: 25,
                    ),
                  ),
                  const Text(
                    'Asal Mula Selat Bali',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder(
                init: VideoController(),
                builder: (c) => Expanded(
                    child: c.videoController.value.isInitialized ? AspectRatio(
                      aspectRatio: c.videoController.value.aspectRatio,
                      child: VideoPlayer(c.videoController),
                    ) : Container(),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}