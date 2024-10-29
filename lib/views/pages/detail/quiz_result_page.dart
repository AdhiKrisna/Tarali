import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/views/widgets/background_widget.dart';
import '../../../constants/constant_colors.dart';

class QuizResultPage extends StatelessWidget {
  const QuizResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final argument = Get.arguments;
    var seconds = argument['counterSecond'];
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
                  const Text(
                    "Selamat!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: blackText,
                    ),
                  ),
                  const Text(
                    "Kamu berhasil menyelesaikan kuis, ini hasilmu:",
                    style: TextStyle(
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
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: blackText,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'Jumlah Pertanyaan',
                                    style: TextStyle(
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
                                    style:  TextStyle(
                                      fontSize: minutes > 0 ? 16 : 20,
                                      fontWeight: FontWeight.w500,
                                      color: blackText,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'Waktu Pengerjaan',
                                    style: TextStyle(
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
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: blackText,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'Benar Menjawab',
                                    style: TextStyle(
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
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: blackText,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'Total nilai',
                                    style: TextStyle(
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
                          onPressed: (){
                            Get.offNamed(RouteName.quizPage, arguments: argument);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child: const Text(
                            'Lihat Jawaban',
                            style: TextStyle(
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
                            Get.offNamed(
                              RouteName.detailContentPage,
                              arguments: argument,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: lightBlue,
                          ),
                          child: const Text(
                            'Menu Utama',
                            style: TextStyle(
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
