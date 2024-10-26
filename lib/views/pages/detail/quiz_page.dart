import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/models/kuis_model.dart';
import 'package:tarali/views/controllers/quiz_controller.dart';
import 'package:tarali/views/widgets/background_widget.dart';
import '../../../constants/constant_colors.dart';
import '../../dialog/list_dialog.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    final argument = Get.arguments;
    List<KuisModel> dataSoal = argument['kuis'];
    final quizController = Get.put(QuizController());
    quizController.setData(lengthData: dataSoal.length);

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
                  'Kuis' ,
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
            Obx(() => Expanded(
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
                            children: [
                              Text(
                                dataSoal[quizController.index.value].soal,
                                style: const TextStyle(
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
                                onPressed: () {
                                  quizController.prevPage();
                                },
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
                                onPressed: () {
                                  if(quizController.index.value == quizController.totalIndex - 1){
                                    if (quizController.choice.contains(-1)) {
                                      Get.snackbar(
                                        'Peringatan',
                                        'Masih ada soal yang belum dijawab. Silahkan jawab semua soal terlebih dahulu karena akan mempengaruhi hasil akhir kuis.',
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: Colors.red,
                                        colorText: Colors.white,
                                      );
                                      return;
                                    }
                                    showDialog(
                                      context: context,
                                      builder: (context) => ListDialog.contentDialog(
                                          context: context,
                                          imageName: 'kuis_dialog',
                                          message: 'Hebat!\nSudah selesai mengerjakan kuis?',
                                          cancelLabel: 'Belum Selesai',
                                          onCancel: (){
                                            Get.back();
                                          },
                                          successLabel: 'Sudah Selesai',
                                          onSuccess: (){
                                            Get.back();
                                            quizController.scoring(dataSoal, argument);
                                          }
                                      ),
                                      barrierDismissible: false,
                                    );
                                  }else{
                                    quizController.nextPage();
                                  }
                                },
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
                    child: Obx((){
                      return ListView(
                        children: [
                          ElevatedButton(
                            onPressed: (){
                              if(quizController.choice[quizController.index.value] == 0){
                                quizController.setChoice(-1);
                              }else{
                                quizController.setChoice(0);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              alignment: Alignment.centerLeft,
                              backgroundColor: quizController.choice[quizController.index.value] == 0 ? lightBlue : white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                'A. ${dataSoal[quizController.index.value].opsi[0]}',
                                style: TextStyle(
                                  color: quizController.choice[quizController.index.value] == 0 ? white : blackText,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
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
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                'B. ${dataSoal[quizController.index.value].opsi[1]}',
                                style: TextStyle(
                                  color: quizController.choice[quizController.index.value] == 1 ? white : blackText,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
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
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                'C. ${dataSoal[quizController.index.value].opsi[2]}',
                                style: TextStyle(
                                  color: quizController.choice[quizController.index.value] == 2 ? white : blackText,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
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
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                'D. ${dataSoal[quizController.index.value].opsi[3]}',
                                style: TextStyle(
                                  color: quizController.choice[quizController.index.value] == 3 ? white : blackText,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),),
          ],
        ),
      ),
    );
  }
}
