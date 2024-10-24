import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/models/warm_up_model.dart';

import '../../../constants/constant_colors.dart';
import '../../../routes/route_name.dart';
import '../../controllers/quiz_controller.dart';
import '../../dialog/list_dialog.dart';
import '../../widgets/background_widget.dart';

class WarmUpPage extends StatelessWidget {
  const WarmUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var argument = Get.arguments;
    WarmUpModel pemanasan = argument['pemanasan'];
    final quizController = Get.put(QuizController());
    quizController.setData(lengthData: 1);

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
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            // const Text(
                            //   'Gambar hewan apa dibawah ini?',
                            //   textAlign: TextAlign.center,
                            //   style: TextStyle(
                            //     fontSize: 16,
                            //     color: blackText,
                            //     fontWeight: FontWeight.w500,
                            //   ),
                            // ),
                            const SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: Container(
                                height: MediaQuery.of(context).size.height * 3 / 5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Image.network(
                                  argument['warmUpBefore'],
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
                                    if(quizController.choice[quizController.index.value] == 1){
                                      quizController.setChoice(-1);
                                    }else{
                                      quizController.setChoice(1);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    alignment: Alignment.centerLeft,
                                    backgroundColor: quizController.choice[quizController.index.value] == 1 ? lightBlue : white,
                                  ),
                                  child: Text(
                                    'A. ${pemanasan.opsi[0]}',
                                    style: TextStyle(
                                      color: quizController.choice[quizController.index.value] == 1 ? white : blackText,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: (){
                                    if(quizController.choice[quizController.index.value] == 2){
                                      quizController.setChoice(-1);
                                    }else{
                                      quizController.setChoice(2);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    alignment: Alignment.centerLeft,
                                    backgroundColor: quizController.choice[quizController.index.value] == 2 ? lightBlue : white,
                                  ),
                                  child: Text(
                                    'B. ${pemanasan.opsi[1]}',
                                    style: TextStyle(
                                      color: quizController.choice[quizController.index.value] == 2 ? white : blackText,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: (){
                                    if(quizController.choice[quizController.index.value] == 3){
                                      quizController.setChoice(-1);
                                    }else{
                                      quizController.setChoice(3);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    alignment: Alignment.centerLeft,
                                    backgroundColor: quizController.choice[quizController.index.value] == 3 ? lightBlue : white,
                                  ),
                                  child: Text(
                                    'C. ${pemanasan.opsi[2]}',
                                    style: TextStyle(
                                      color: quizController.choice[quizController.index.value] == 3 ? white : blackText,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: (){
                                    if(quizController.choice[quizController.index.value] == 4){
                                      quizController.setChoice(-1);
                                    }else{
                                      quizController.setChoice(4);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    alignment: Alignment.centerLeft,
                                    backgroundColor: quizController.choice[quizController.index.value] == 4 ? lightBlue : white,
                                  ),
                                  child: Text(
                                    'D. ${pemanasan.opsi[3]}',
                                    style: TextStyle(
                                      color: quizController.choice[quizController.index.value] == 4 ? white : blackText,
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
                            onPressed: (){
                              showDialog(
                                context: context,
                                builder: (context) => ListDialog.contentDialog(
                                  context: context,
                                  imageName: 'warm_up_dialog',
                                  message: 'Hore, pemanasannya sudah selesai!\nSudah siap untuk bercerita?',
                                  cancelLabel: 'Batal',
                                  onCancel: (){
                                    Get.back();
                                  },
                                  successLabel: 'Ayo Bercerita',
                                  onSuccess: (){
                                    Get.back();
                                    Get.toNamed(
                                      RouteName.readingTestPage,
                                      arguments: argument,
                                    );
                                  }
                                ),
                                barrierDismissible: false,
                              );
                            },
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
