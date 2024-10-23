import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/views/widgets/background_widget.dart';

import '../../../routes/route_name.dart';
import '../../dialog/list_dialog.dart';

class ReadingTestPage extends StatelessWidget {
  const ReadingTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    var argument = Get.arguments;

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
                        onPressed: (){},
                        child: const Icon(
                          Icons.file_upload,
                          size: 30,
                          color: white,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: lightBlue,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(10),
                        ),
                        onPressed: (){
                          showDialog(
                            context: context,
                            builder: (context) => ListDialog.contentDialog(
                                context: context,
                                imageName: 'read_test_dialog',
                                message: 'Hebat!\nSudah selesai merekam?',
                                cancelLabel: 'Belum Selesai',
                                onCancel: (){
                                  Get.back();
                                },
                                successLabel: 'Sudah Selesai',
                                onSuccess: (){
                                  Get.back();
                                  Get.toNamed(RouteName.testResultPage);
                                }
                            ),
                            barrierDismissible: false,
                          );
                        },
                        child: const Icon(
                          Icons.mic,
                          size: 30,
                          color: white,
                        ),
                      ),
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
