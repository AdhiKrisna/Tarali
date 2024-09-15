import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/views/controllers/quiz_controller.dart';
import 'package:tarali/views/widgets/background_widget.dart';

import '../../../constants/constant_colors.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    final quizController = Get.put(QuizController());

    return Scaffold(
      body: BackgroundWidget.setMainBackground(
        context: context,
        child: Obx(() => Column(
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
                const Text(
                  'Kuis',
                  style: TextStyle(
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
                  Container(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Pertanyaan nomor ',
                              style: TextStyle(
                                fontSize: 10,
                                color: greyText,
                              ),
                            ),
                            Text(
                              quizController.detailPage(),
                              style: const TextStyle(
                                fontSize: 10,
                                color: lightBlue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: ListView(
                            children: const [
                              Text(
                                'Apa yang dilakukan Naga Besukih setelah Manik Angkeran memotong ekornya?',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: blackText,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 20,
                                  ),
                                ),
                                child: const Text(
                                  'Sebelumnya',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: lightBlue,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: lightBlue,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 20,
                                  ),
                                ),
                                child: const Text(
                                  'Selanjutnya',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        ElevatedButton(
                          onPressed: (){
                            if(quizController.choice.value == 1){
                              quizController.setChoice(0.obs);
                            }else{
                              quizController.setChoice(1.obs);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            alignment: Alignment.centerLeft,
                            backgroundColor: quizController.choice.value == 1 ? lightBlue : white,
                          ),
                          child: Text(
                            'A. Menghidupkan Manik Angkeran',
                            style: TextStyle(
                              color: quizController.choice.value == 1 ? white : blackText,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: (){
                            if(quizController.choice.value == 2){
                              quizController.setChoice(0.obs);
                            }else{
                              quizController.setChoice(2.obs);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            alignment: Alignment.centerLeft,
                            backgroundColor: quizController.choice.value == 2 ? lightBlue : white,
                          ),
                          child: Text(
                            'B. Memberi lebih banyak harta',
                            style: TextStyle(
                              color: quizController.choice.value == 2 ? white : blackText,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: (){
                            if(quizController.choice.value == 3){
                              quizController.setChoice(0.obs);
                            }else{
                              quizController.setChoice(3.obs);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            alignment: Alignment.centerLeft,
                            backgroundColor: quizController.choice.value == 3 ? lightBlue : white,
                          ),
                          child: Text(
                            'C. Memisahkan Pulau Jawa dan Bali',
                            style: TextStyle(
                              color: quizController.choice.value == 3 ? white : blackText,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: (){
                            if(quizController.choice.value == 4){
                              quizController.setChoice(0.obs);
                            }else{
                              quizController.setChoice(4.obs);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            alignment: Alignment.centerLeft,
                            backgroundColor: quizController.choice.value == 4 ? lightBlue : white,
                          ),
                          child: Text(
                            'D. Mengundang Prabu Menak Dadali',
                            style: TextStyle(
                              color: quizController.choice.value == 4 ? white : blackText,
                              fontSize: 14,
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
        ),),
      ),
    );
  }
}
