import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/constants/constant_text_style.dart';
import 'package:tarali/views/controllers/dashboard_controller.dart';
import 'package:tarali/views/controllers/read_test_controller.dart';
import 'package:tarali/views/dialog/list_dialog.dart';
import 'package:tarali/views/widgets/background_widget.dart';

class ReadingTestPage extends StatelessWidget {
  const ReadingTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    var argument = Get.arguments;
    final DashboardController dashboardController = Get.find();
    final story = argument['ayoBercerita']
        .toString()
        .replaceAll(r'\n', '\n')
        .replaceAll(r'\t',
            '\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0');
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
                style: PoppinsStyle.stylePoppins(
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
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                         Container(
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.15,
                          right: MediaQuery.of(context).size.width * 0.15,
                          bottom: 20,
                        ),
                        height: MediaQuery.of(context).size.height * 0.6,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: Border.all(
                              style: BorderStyle.solid,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FutureBuilder<String>(
                            future: argument != null
                                ? dashboardController.cs.getImageAyoBercerita(
                                    argument['pathStorage'])
                                : Future.value(''),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              return Image.network(
                                snapshot.data!,
                                width: MediaQuery.of(context).size.width * 0.5,
                                fit: BoxFit.fill,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  (loadingProgress
                                                      .expectedTotalBytes!)
                                              : null,
                                    ),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) =>
                                    const Center(child: Icon(Icons.error)),
                              );
                            },
                          ),
                        )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: lightBlue,
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(10),
                              ),
                              onPressed: () {
                                readTestController.pickAudioFile(argument);
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
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.cancel,
                                            color: Colors.red, size: 30),
                                        onPressed:
                                            readTestController.stopVoiceStream,
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
                                          style: PoppinsStyle.stylePoppins(
                                              color: Colors.white,
                                              decoration: TextDecoration.none,
                                              fontSize: 16),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      IconButton(
                                        icon: readTestController.isPaused.isTrue
                                            ? const Icon(Icons.play_circle,
                                                color: white, size: 30)
                                            : const Icon(Icons.pause_circle,
                                                color: white, size: 30),
                                        onPressed: () {
                                          readTestController.isPaused.isTrue
                                              ? readTestController
                                                  .resumeVoiceStream()
                                              : readTestController
                                                  .pauseVoiceStream();
                                        },
                                      ),
                                      const SizedBox(width: 10),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                          size: 30,
                                        ),
                                        onPressed: () {
                                          readTestController.stopVoiceStream();
                                          showDialog(
                                            context: context,
                                            builder: (context) =>
                                                ListDialog.contentDialog(
                                                    context: context,
                                                    imageName:
                                                        'read_test_dialog',
                                                    message:
                                                        'Kerja bagus!\nSudah selesai merekam?',
                                                    cancelLabel: 'Ulangi',
                                                    onCancel: () {
                                                      Get.back();
                                                    },
                                                    successLabel:
                                                        'Sudah Selesai',
                                                    onSuccess: () async {
                                                      Get.back();
                                                      await readTestController
                                                          .uploadVoiceStream(
                                                              argument);
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
                          ],
                        ),
                       
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      story,
                      textAlign: TextAlign.justify,
                      style: PoppinsStyle.stylePoppins(
                        fontSize: 14,
                        color: blackText,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
