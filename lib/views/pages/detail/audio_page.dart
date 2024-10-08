import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/views/controllers/player_controller.dart';

import '../../../constants/constant_colors.dart';
import '../../widgets/pause_play_button.dart';
import '../../widgets/replay_button.dart';
import '../../widgets/slider_widget.dart';

class AudioPage extends StatelessWidget {
  const AudioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String title = Get.arguments;
    final controller = Get.put(PlayerController());

    return Scaffold(
      body: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 2 / 5,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 20,
                    left: 20,
                    right: 20,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: MediaQuery.of(context).size.height / 2,
                    child: const Image(
                      image: AssetImage('assets/images/cover1.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                const SliderWidget(),
                SizedBox(
                  height:
                  MediaQuery.of(context).size.height * 0.025,
                ),
                Obx(
                      () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => controller.fastBackward(),
                        icon: const Icon(Icons.fast_rewind_rounded,
                            color: lightBlue, size: 30),
                      ),
                      controller.isReplay.isFalse
                          ? const PausePlayButton()
                          : const ReplayButton(),
                      IconButton(
                        onPressed: () => controller.fastForward(),
                        icon: const Icon(Icons.fast_forward_rounded,
                            color: lightBlue, size: 30),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/detail_bg.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SafeArea(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: (){
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: IconButton(
                      onPressed: (){
                      },
                      icon: const Icon(
                        Icons.fullscreen,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
