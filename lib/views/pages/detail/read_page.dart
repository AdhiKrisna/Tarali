import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/views/controllers/read_controller.dart';
import 'package:tarali/views/dialog/list_dialog.dart';
import 'package:tarali/views/widgets/background_widget.dart';

import '../../../routes/route_name.dart';

class ReadPage extends StatelessWidget {
  const ReadPage({super.key});

  @override
  Widget build(BuildContext context) {
    var argument = Get.arguments;
    final title = argument['title'];
    final pageTotal = argument['pageTotal'];
    final readController = Get.put(
      ReadController(),
    );
    return Scaffold(
        body: BackgroundWidget.setContentBackground(
            context: context,
            child: Column(
              children: [
                Expanded(
                    child: Obx(
                  () => Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 30,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: white,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: const Icon(
                                      Icons.keyboard_arrow_left,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                  ),
                                  Text(
                                    title,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Image.network(
                                  argument['readContent'][readController.index.value - 1],
                                  fit: BoxFit.fill,
                                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress.expectedTotalBytes != null
                                            ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes!)
                                            : null,
                                      ),
                                    );
                                  },
                                  errorBuilder: (context, error, stackTrace) => const Center(child: Icon(Icons.error)),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Halaman ',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: greyText,
                                    ),
                                  ),
                                  Text(
                                    '${readController.index} dari $pageTotal',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: lightBlue,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                readController.index > 1 ? lightBlue : greyText,
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(10),
                          ),
                          onPressed: () {
                            if (readController.index > 1) {
                              readController.prev();
                            }
                          },
                          child: const Icon(
                            Icons.keyboard_arrow_left,
                            size: 30,
                            color: white,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: lightBlue,
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(10),
                          ),
                          onPressed: () {
                            if (readController.index < pageTotal) {
                              readController.next();
                            } else if (readController.index.value == pageTotal) {
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    ListDialog.contentDialog(
                                      context: context,
                                      imageName: 'read_dialog',
                                      message: 'Sudah selesai membaca?\nIngin ulang membaca lagi?',
                                      cancelLabel: 'Ulangi Membaca',
                                      onCancel: (){
                                        Get.back();
                                      },
                                      successLabel: 'Ayo Bercerita',
                                      onSuccess: (){
                                        Get.back();
                                        Get.toNamed(RouteName.warmUpPage);
                                      }
                                    ),
                                barrierDismissible: false,
                              );
                            }
                          },
                          child: const Icon(
                            Icons.keyboard_arrow_right,
                            size: 30,
                            color: white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            )));
  }
}
