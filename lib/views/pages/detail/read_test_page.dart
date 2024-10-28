import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/views/controllers/read_test_controller.dart';
import 'package:tarali/views/dialog/list_dialog.dart';
import 'package:tarali/views/widgets/background_widget.dart';

class ReadingTestPage extends StatelessWidget {
  const ReadingTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    var argument = Get.arguments;
    final ReadTestController readTestController = Get.put(ReadTestController());
    return BackgroundWidget.setWhiteBackground(
      context: context,
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                argument['title'],
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Stack(
              children: [
                ListView(
                  children: [
                    Text(
                      argument['ayoBercerita'],
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 14,
                        color: blackText,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: lightBlue,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(10),
                        ),
                        onPressed: () {
                          readTestController.pickAudioFile();
                        },
                        child: const Icon(
                          Icons.file_upload,
                          size: 30,
                          color: white,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() {
                        // Menampilkan UI yang berbeda berdasarkan kondisi isRecording
                        return readTestController.isRecording.isTrue
                            ? Container(
                                decoration: BoxDecoration(
                                  color: lightBlue,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.all(10),
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.cancel, color: Colors.red, size: 30),
                                      onPressed: readTestController.stopVoiceStream,
                                    ),
                                    const SizedBox(width: 10),
                                   Obx(
                                      () => Text(
                                          readTestController.counterSecond < 60
                                              ? '00:${readTestController.counterSecond.toString().padLeft(2, '0')}'
                                              : readTestController
                                                          .counterSecond <
                                                      600
                                                  ? '0${(readTestController.counterSecond ~/ 60).toString()}:${(readTestController.counterSecond % 60).toString().padLeft(2, '0')}'
                                                  : '${(readTestController.counterSecond ~/ 60).toString()}:${(readTestController.counterSecond % 60).toString().padLeft(2, '0')}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              overflow: TextOverflow.ellipsis, // Potong teks jika terlalu panjang
                                              fontSize: 16)),
                                    ), // Timer bisa diimplementasikan lebih lanjut
                                    const SizedBox(width: 10),
                                    IconButton(
                                      icon: readTestController.isPaused.isTrue
                                          ? const Icon(Icons.play_circle, color: white, size: 30)
                                          : const Icon(Icons.pause_circle, color: white, size: 30),
                                      onPressed: () {
                                        readTestController.isPaused.isTrue
                                            ? readTestController.resumeVoiceStream()
                                            : readTestController.pauseVoiceStream();
                                      },
                                    ),
                                    const SizedBox(width: 10),
                                    IconButton(
                                      icon: const Icon(Icons.check_circle,
                                          color: Colors.green, size: 30),
                                      onPressed: () {
                                        readTestController.stopVoiceStream();
                                        showDialog(
                                          context: context,
                                          builder: (context) => ListDialog.contentDialog(
                                              context: context,
                                              imageName: 'read_test_dialog',
                                              message: 'Hebat!\nSudah selesai merekam?',
                                              cancelLabel: 'Belum Selesai',
                                              onCancel: () {
                                                Get.back();
                                              },
                                              successLabel: 'Sudah Selesai',
                                              onSuccess: () {
                                                Get.back();
                                                Get.offNamed(
                                                  RouteName.testResultPage,
                                                  arguments: argument,
                                                );
                                              }),
                                          barrierDismissible: false,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                            )
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: lightBlue,
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(10),
                                ),
                                onPressed: () {
                                  readTestController.startVoiceStream();
                                },
                                child: const Icon(
                                  Icons.mic,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              );
                      }),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: lightBlue,
                      //     shape: const CircleBorder(),
                      //     padding: const EdgeInsets.all(10),
                      //   ),
                      //   onPressed: () {
                      //     // Start recording audio
                      //     readTestController.isRecording.isFalse
                      //         ? readTestController.startVoiceStream()
                      //         : readTestController.stopVoiceStream();

                      //   },
                      //   child: Obx(
                      //     () => Icon(
                      //       readTestController.isRecording.isTrue
                      //           ? Icons.stop
                      //           : Icons.mic,
                      //       size: 30,
                      //       color: white,
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
