import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/views/controllers/scoring/scoring_controller.dart';
import 'package:tarali/views/widgets/background_screen.dart';
import 'package:tarali/views/widgets/pause_play_button.dart';
import 'package:tarali/views/widgets/replay_button.dart';
import 'package:tarali/views/widgets/slider_widget.dart';
import 'package:tarali/views/controllers/player_controller.dart';

class ScoringPage extends StatelessWidget {
  const ScoringPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dynamic arguments = Get.arguments;
    // final String nama = Get.arguments;
    final String title = arguments[0];
    final String nama = arguments[1];
    final PlayerController controller = Get.put(PlayerController(title: title));
    final ScoringController scoringController = Get.put(ScoringController());
    return Scaffold(
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Stack(
            children: [
              const BackgroundScreenWidget(),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.01,
                    bottom: MediaQuery.of(context).size.height * 0.02,
                  ),
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.05,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.50,
                                width: MediaQuery.of(context).size.width < 760
                                    ? MediaQuery.of(context).size.width * 0.225
                                    : MediaQuery.of(context).size.width * 0.18,
                                child: const Image(
                                  image: AssetImage('assets/images/cover1.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                             SliderWidget(),
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
                        SizedBox(
                          width: MediaQuery.of(context).size.width < 760
                              ? MediaQuery.of(context).size.width * 0.575
                              : MediaQuery.of(context).size.width * 0.6,
                          height: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.05,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        disabledBackgroundColor: Colors.white,
                                        backgroundColor: Colors.white,
                                        shape: const CircleBorder(),
                                      ),
                                      onPressed: () => Get.back(),
                                      child: Icon(
                                        size:
                                            MediaQuery.of(context).size.width <
                                                    760
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.03
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.025,
                                        Icons.arrow_back_ios_new_sharp,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02),
                                    Text(
                                      nama,
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.035,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Nilai',
                                                style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.025,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                  top: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.02,
                                                ),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                                decoration: BoxDecoration(
                                                  color: white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: TextFormField(
                                                  keyboardType: TextInputType.number,
                                                  controller: scoringController.scoreController,
                                                  style: TextStyle(
                                                    color: greyText,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.025,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    fillColor: greyText,
                                                    contentPadding:
                                                        EdgeInsets.all(
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.01,
                                                    ),
                                                    border: InputBorder.none,
                                                    focusedBorder:
                                                        const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: bgBlue,
                                                          width: 1),
                                                    ),
                                                    hintText: 'Masukan nilai',
                                                    hintStyle: TextStyle(
                                                      color: greyText,
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.025,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.02),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Kelas',
                                                style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.025,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.02,
                                                  vertical: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width <
                                                          760
                                                      ? MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.028
                                                      : MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.03,
                                                ),
                                                margin: EdgeInsets.only(
                                                  top: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.02,
                                                ),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.1,
                                                decoration: BoxDecoration(
                                                  color: white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '5DA',
                                                    style: TextStyle(
                                                      color: greyText,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.025,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.02),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Absen',
                                                style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.025,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.02,
                                                  vertical: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width <
                                                          760
                                                      ? MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.028
                                                      : MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.03,
                                                ),
                                                margin: EdgeInsets.only(
                                                  top: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.02,
                                                ),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.1,
                                                decoration: BoxDecoration(
                                                  color: white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '22',
                                                    style: TextStyle(
                                                      color: greyText,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.025,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),
                                      Text(
                                        'Catatan',
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.025,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                        ),
                                        decoration: BoxDecoration(
                                          color: white,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: TextFormField(
                                          controller: scoringController.noteController,
                                          maxLines: 5,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.01,
                                            ),
                                            border: InputBorder.none,
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: bgBlue, width: 1),
                                            ),
                                            hintText: 'Tulis catatan disini',
                                            hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.025,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),
                                      ElevatedButton(
                                        onPressed: () {
                                          ScoringController().saveScore(
                                            int.parse(scoringController.scoreController.text),
                                            scoringController.noteController.text,
                                            title,
                                            nama,
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: lightBlue,
                                          disabledBackgroundColor: lightBlue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          minimumSize: Size(
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            vertical: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.1,
                                          ),
                                        ),
                                        child: Text(
                                          'Simpan',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.025,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
