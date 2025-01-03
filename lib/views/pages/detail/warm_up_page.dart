import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_text_style.dart';
import 'package:tarali/models/warm_up_model.dart';
import 'package:tarali/views/controllers/quiz_controller.dart';
import 'package:tarali/views/dialog/list_dialog.dart';
import 'package:tarali/views/widgets/background_widget.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:audioplayers/audioplayers.dart';

class WarmUpPage extends StatelessWidget {
  const WarmUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AudioPlayer audioPlayer = AudioPlayer();
    var argument = Get.arguments;
    WarmUpModel pemanasan = argument['pemanasan'];
    final quizController = Get.put(QuizController());
    quizController.setData(lengthData: 1);
    quizController.setImageUrl(url: argument['warmUpBefore']);
    bool isCorrect = false;

    return Scaffold(
      body: BackgroundWidget.setMainBackground(
        context: context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  'Pemanasan',
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
              height: 10,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        padding: const EdgeInsets.all(10),
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
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Pemanasan dulu yuk, ayo main tebak gambar!',
                              style: PoppinsStyle.stylePoppins(
                                fontSize: 10,
                                color: greyText,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 3 / 5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Obx(
                                  () => Image.network(
                                    quizController.imageUrl.value,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Obx(() {
                            return ListView(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    if (quizController.choice[
                                            quizController.index.value] ==
                                        0) {
                                      quizController.setChoice(-1);
                                    } else {
                                      quizController.setChoice(0);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    alignment: Alignment.centerLeft,
                                    backgroundColor: quizController.choice[
                                                quizController.index.value] ==
                                            0
                                        ? lightBlue
                                        : white,
                                  ),
                                  child: Text(
                                    'A. ${pemanasan.opsi[0]}',
                                    style: PoppinsStyle.stylePoppins(
                                      color: quizController.choice[
                                                  quizController.index.value] ==
                                              0
                                          ? white
                                          : blackText,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (quizController.choice[
                                            quizController.index.value] ==
                                        1) {
                                      quizController.setChoice(-1);
                                    } else {
                                      quizController.setChoice(1);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    alignment: Alignment.centerLeft,
                                    backgroundColor: quizController.choice[
                                                quizController.index.value] ==
                                            1
                                        ? lightBlue
                                        : white,
                                  ),
                                  child: Text(
                                    'B. ${pemanasan.opsi[1]}',
                                    style: PoppinsStyle.stylePoppins(
                                      color: quizController.choice[
                                                  quizController.index.value] ==
                                              1
                                          ? white
                                          : blackText,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (quizController.choice[
                                            quizController.index.value] ==
                                        2) {
                                      quizController.setChoice(-1);
                                    } else {
                                      quizController.setChoice(2);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    alignment: Alignment.centerLeft,
                                    backgroundColor: quizController.choice[
                                                quizController.index.value] ==
                                            2
                                        ? lightBlue
                                        : white,
                                  ),
                                  child: Text(
                                    'C. ${pemanasan.opsi[2]}',
                                    style: PoppinsStyle.stylePoppins(
                                      color: quizController.choice[
                                                  quizController.index.value] ==
                                              2
                                          ? white
                                          : blackText,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (quizController.choice[
                                            quizController.index.value] ==
                                        3) {
                                      quizController.setChoice(-1);
                                    } else {
                                      quizController.setChoice(3);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    alignment: Alignment.centerLeft,
                                    backgroundColor: quizController.choice[
                                                quizController.index.value] ==
                                            3
                                        ? lightBlue
                                        : white,
                                  ),
                                  child: Text(
                                    'D. ${pemanasan.opsi[3]}',
                                    style: PoppinsStyle.stylePoppins(
                                      color: quizController.choice[
                                                  quizController.index.value] ==
                                              3
                                          ? white
                                          : blackText,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (isCorrect) {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      ListDialog.contentDialog(
                                          context: context,
                                          imageName: 'warm_up_dialog',
                                          message:
                                              'Hore, pemanasannya sudah selesai!\nSudah siap untuk bercerita?',
                                          cancelLabel: 'Batal',
                                          onCancel: () {
                                            Get.back();
                                          },
                                          successLabel: 'Ayo Bercerita',
                                          onSuccess: () {
                                            Get.back();
                                            Get.offNamed(
                                              RouteName.readingTestPage,
                                              arguments: argument,
                                            );
                                          }),
                                  barrierDismissible: false,
                                );
                              } else {
                                if (quizController.choice[0] == pemanasan.jawaban) {
                                  isCorrect = true;
                                  audioPlayer.play(AssetSource('audio/benar.mp3'));
                                  quizController.setImageUrl(url: argument['warmUpAfter']);
                                  if (ScaffoldMessenger.of(context).mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Jawabanmu benar! Kamu siap untuk tes bercerita!'),
                                        backgroundColor: Colors.green,
                                        duration: Duration(seconds: 3),
                                      ),
                                    );
                                  }
                                } else {
                                  //soundeffect
                                  audioPlayer.play(AssetSource('audio/salah.mp3'));
                                  if (ScaffoldMessenger.of(context).mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Jawabanmu salah. Jangan menyerah ayo coba lagi!'),
                                        backgroundColor: Colors.red,
                                        duration: Duration(seconds: 1),
                                      ),
                                    );
                                  }
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: lightBlue,
                            ),
                            child: Text(
                              'Selesai',
                              style: PoppinsStyle.stylePoppins(
                                color: white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
