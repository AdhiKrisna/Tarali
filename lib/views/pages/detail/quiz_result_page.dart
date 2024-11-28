import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_text_style.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/services/scoring_service.dart';
import 'package:tarali/views/widgets/background_widget.dart';
import 'package:tarali/constants/constant_colors.dart';

class QuizResultPage extends StatelessWidget {
  const QuizResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final argument = Get.arguments;
    var seconds = argument['counterSecond'];
    ScoringService ss = ScoringService();
    final AudioPlayer audioPlayer = AudioPlayer();
    var minutes = 0;
    if(seconds > 60){
       minutes = (seconds / 60).toInt();
      seconds = seconds % 60;
    }
    return Scaffold(
      body: BackgroundWidget.setWhiteBackground(
        context: context,
        child: Row(
          children: [
            Image.asset(
              width: MediaQuery.of(context).size.width * 2 / 5,
              height: double.infinity,
              'assets/images/quiz_result.png',
              fit: BoxFit.fill,
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                    "Selamat!",
                    style: PoppinsStyle.stylePoppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: blackText,
                    ),
                  ),
                   Text(
                    "Kamu berhasil menyelesaikan kuis, ini hasilmu:",
                    style: PoppinsStyle.stylePoppins(
                      fontSize: 12,
                      color: blackText,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.layers,
                                size: 24,
                                color: lightBlue,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${argument['totalSoal']} Soal',
                                    style: PoppinsStyle.stylePoppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: blackText,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                   Text(
                                    'Jumlah Pertanyaan',
                                    style: PoppinsStyle.stylePoppins(
                                      fontSize: 12,
                                      color: greyText,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.access_time_filled_outlined,
                                size: 24,
                                color: lightBlue,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    minutes > 0 ? '$minutes Menit $seconds detik' : '$seconds Detik' ,
                                    style:  PoppinsStyle.stylePoppins(
                                      fontSize: minutes > 0 ? 16 : 20,
                                      fontWeight: FontWeight.w500,
                                      color: blackText,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                   Text(
                                    'Waktu Pengerjaan',
                                    style: PoppinsStyle.stylePoppins(
                                      fontSize: 12,
                                      color: greyText,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.star,
                                size: 24,
                                color: lightBlue,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${argument['benar']} dari ${argument['totalSoal']}",
                                    style:  PoppinsStyle.stylePoppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: blackText,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                   Text(
                                    'Benar Menjawab',
                                    style: PoppinsStyle.stylePoppins(
                                      fontSize: 12,
                                      color: greyText,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.credit_score_rounded,
                                size: 24,
                                color: lightBlue,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${argument['quizScore'].toStringAsFixed(2)} dari 100",
                                    style:  PoppinsStyle.stylePoppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: blackText,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                   Text(
                                    'Total nilai',
                                    style: PoppinsStyle.stylePoppins(
                                      fontSize: 12,
                                      color: greyText,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: ()async{
                              audioPlayer.play(AssetSource('audio/salah.mp3'));

                            if(argument['quizScore'] < 80){
                              Get.snackbar(
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                                'Gagal Melihat Jawaban',
                                'Nilaimu belum mencapai 80, silahkan coba lagi.',
                              );
                            }else{
                              argument['isFinishedQuiz'] = true;
                              argument['resultQuiz'] = await ss.getQuizAnswers(arguments: argument);
                              Get.offNamed(RouteName.quizAnswerPage, arguments: argument);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child:  Text(
                            'Lihat Jawaban',
                            style: PoppinsStyle.stylePoppins(
                              color: white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: (){
                            Get.snackbar(
                              "Nilai Tersimpan",
                              "Silahkan cek nilaimu pada menu \"Riwayat\"",
                              backgroundColor: Colors.green,
                              colorText: Colors.white,
                            );
                            if(argument['quizScore'] >= 80){
                              argument['isFinishedQuiz'] = true;
                            }
                            Get.offAllNamed(RouteName.dashboard);
                            Get.reload();
                            Get.toNamed(
                              RouteName.detailContentPage,
                              arguments: argument,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: lightBlue,
                          ),
                          child:  Text(
                            'Halaman Buku',
                            style: PoppinsStyle.stylePoppins(
                              color: white,
                            ),
                          ),
                        ),
                      ),
                    ],
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
