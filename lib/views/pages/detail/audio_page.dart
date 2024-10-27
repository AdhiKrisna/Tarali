import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tarali/views/controllers/player_controller.dart';
import 'package:tarali/views/widgets/background_widget.dart';

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
      body: Stack(
        children: [
          BackgroundWidget.setMainBackground(
            context: context,
            padding: 0,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15,
                    bottom: MediaQuery.of(context).size.height * 0.02),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: GetBuilder(
                      init: PlayerController(url: url),
                      builder: (c) => c.duration.value > 0
                          ? Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.45,
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: Image.network(
                                    argument['cover'],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.005,
                                ),
                                Column(
                                  children: [
                                    SliderWidget(isFullScreen: true),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height * 0.025,
                                    ),
                                    Obx(
                                      () => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            onPressed: () => c.fastBackward(),
                                            icon: const Icon(
                                                Icons.fast_rewind_rounded,
                                                color: lightBlue,
                                                size: 30),
                                          ),
                                          c.isReplay.isFalse
                                              ? const PausePlayButton()
                                              : const ReplayButton(),
                                          IconButton(
                                            onPressed: () => c.fastForward(),
                                            icon: const Icon(
                                                Icons.fast_forward_rounded,
                                                color: lightBlue,
                                                size: 30),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : const Align(
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(),
                            ),
                    )),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              title: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
