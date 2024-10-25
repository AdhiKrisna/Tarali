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
    var argument = Get.arguments;
    final String url = argument['audioUrl'];
    final String title = argument['title'];

    return Scaffold(
      body: Row(
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 2 / 5,
              color: Colors.white,
              child: GetBuilder(
                init: PlayerController(url: url),
                builder: (c) => c.duration.value > 0
                    ? Column(
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
                              height: MediaQuery.of(context).size.height * 0.50,
                              width: MediaQuery.of(context).size.width < 760
                                  ? MediaQuery.of(context).size.width * 0.225
                                  : MediaQuery.of(context).size.width * 0.18,
                              child: Image.network(
                                argument['coverDashboard'],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          SliderWidget(),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () => c.fastBackward(),
                                  icon: const Icon(Icons.fast_rewind_rounded,
                                      color: lightBlue, size: 30),
                                ),
                                c.isReplay.isFalse
                                    ? const PausePlayButton()
                                    : const ReplayButton(),
                                IconButton(
                                  onPressed: () => c.fastForward(),
                                  icon: const Icon(Icons.fast_forward_rounded,
                                      color: lightBlue, size: 30),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : const Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      ),
              )),
          Expanded(
            child: Stack(
              children: [
                Container(
                  child: Image.network(
                    argument['cover'],
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
                SafeArea(
                  child: Row(
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
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
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
                      onPressed: () {},
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
