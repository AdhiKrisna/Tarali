import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/constants/constant_text_style.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/views/widgets/background_widget.dart';

class TestResultPage extends StatelessWidget {
  const TestResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    var argument = Get.arguments;
    return Scaffold(
      body: BackgroundWidget.setWhiteBackground(
        context: context,
        child: Row(
          children: [
            Image.asset(
              width: MediaQuery.of(context).size.width * 2 / 5,
              height: double.infinity,
              'assets/images/result.png',
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
                    "Kamu baru saja selesai mengikuti tes membaca!",
                    style: PoppinsStyle.stylePoppins(
                      fontSize: 12,
                      color: blackText,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
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
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '80% terdeteksi',
                                style: PoppinsStyle.stylePoppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: blackText,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Bacaanmu benar, gurumu juga akan menilai keterampilan membacamu dan segera memberikan komentar',
                                style: PoppinsStyle.stylePoppins(
                                  fontSize: 12,
                                  color: greyText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Get.offNamed(
                              RouteName.readingTestPage,
                              arguments: argument,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            surfaceTintColor: Colors.white,
                          ),
                          child:  Text(
                            'Ulangi Tes',
                            style: PoppinsStyle.stylePoppins(
                              color: lightBlue,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Get.offNamed(
                              RouteName.detailContentPage,
                              arguments: argument,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            surfaceTintColor: Colors.white,
                          ),
                          child:  Text(
                            'Halaman Buku',
                            style: PoppinsStyle.stylePoppins(
                              color: lightBlue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offNamed(
                          RouteName.quizPage,
                          arguments: argument,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: lightBlue,
                      ),
                      child:  Text(
                        'Lanjut ke kuis',
                        style: PoppinsStyle.stylePoppins(
                          color: white,
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
    );
  }
}
