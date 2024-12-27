import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/views/controllers/player_controller.dart';

class PausePlayButton extends StatelessWidget {
  const PausePlayButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
  final PlayerController pausePlayController = Get.find();
    return Container(
      decoration: const BoxDecoration(
        color: lightBlue,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: EdgeInsets.all(
            MediaQuery.of(context).size.width * 0.001),
        child: IconButton(
          icon: Obx(() => Icon(
                pausePlayController.isPlaying.value? Icons.pause: Icons.play_arrow,
                color: Colors.white,
                size: MediaQuery.of(context).size.width *
                    0.035,
              )),
          onPressed: () =>
              pausePlayController.togglePlaying(),
        ),
      ),
    );
  }
}
