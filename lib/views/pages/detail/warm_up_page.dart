import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../constants/constant_colors.dart';
import '../../controllers/quiz_controller.dart';
import '../../widgets/background_widget.dart';

class WarmUpPage extends StatelessWidget {
  const WarmUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final quizController = Get.put(QuizController());

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
                            const Text(
                              'Pemanasan dulu yuk, ayo main tebak gambar!',
                              style: TextStyle(
                                fontSize: 10,
                                color: greyText,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Gambar hewan apa dibawah ini?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: blackText,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: Container(
                                height: MediaQuery.of(context).size.height * 3 / 5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Image.asset(
                                  'assets/images/quiz.png',
                                  fit: BoxFit.fill,
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
                          child: Obx((){
                            return ListView(
                              children: [
                                ElevatedButton(
                                  onPressed: (){
                                    if(quizController.choice.value == 1){
                                      quizController.setChoice(0);
                                    }else{
                                      quizController.setChoice(1);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    alignment: Alignment.centerLeft,
                                    backgroundColor: quizController.choice.value == 1 ? lightBlue : white,
                                  ),
                                  child: Text(
                                    'A. Sapi',
                                    style: TextStyle(
                                      color: quizController.choice.value == 1 ? white : blackText,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: (){
                                    if(quizController.choice.value == 2){
                                      quizController.setChoice(0);
                                    }else{
                                      quizController.setChoice(2);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    alignment: Alignment.centerLeft,
                                    backgroundColor: quizController.choice.value == 2 ? lightBlue : white,
                                  ),
                                  child: Text(
                                    'B. Ikan',
                                    style: TextStyle(
                                      color: quizController.choice.value == 2 ? white : blackText,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: (){
                                    if(quizController.choice.value == 3){
                                      quizController.setChoice(0);
                                    }else{
                                      quizController.setChoice(3);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    alignment: Alignment.centerLeft,
                                    backgroundColor: quizController.choice.value == 3 ? lightBlue : white,
                                  ),
                                  child: Text(
                                    'C. Beruang',
                                    style: TextStyle(
                                      color: quizController.choice.value == 3 ? white : blackText,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: (){
                                    if(quizController.choice.value == 4){
                                      quizController.setChoice(0);
                                    }else{
                                      quizController.setChoice(4);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    alignment: Alignment.centerLeft,
                                    backgroundColor: quizController.choice.value == 4 ? lightBlue : white,
                                  ),
                                  child: Text(
                                    'D. Kuda',
                                    style: TextStyle(
                                      color: quizController.choice.value == 4 ? white : blackText,
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
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: lightBlue,
                            ),
                            child: const Text(
                              'Selesai',
                              style: TextStyle(
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
