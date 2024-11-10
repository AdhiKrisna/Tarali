import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/constants/constant_text_style.dart';
import 'package:tarali/views/controllers/read_controller.dart';
import 'package:tarali/views/dialog/list_dialog.dart';
import 'package:tarali/routes/route_name.dart';

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
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Obx(
                      () => Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width * 0.05,
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
                                      style: PoppinsStyle.stylePoppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  height: MediaQuery.of(context).size.height * 0.725,
                                  child: Image.network(
                                    argument['readContent']
                                    [readController.index.value - 1],
                                    fit: BoxFit.fill,
                                    loadingBuilder: (BuildContext context, Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress.expectedTotalBytes !=
                                              null
                                              ? loadingProgress.cumulativeBytesLoaded /
                                              (loadingProgress.expectedTotalBytes!)
                                              : null,
                                        ),
                                      );
                                    },
                                    errorBuilder: (context, error, stackTrace) =>
                                    const Center(child: Icon(Icons.error)),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                     Text(
                                      'Halaman ',
                                      style: PoppinsStyle.stylePoppins(
                                        fontSize: 12,
                                        color: greyText,
                                      ),
                                    ),
                                    Text(
                                      '${readController.index} dari $pageTotal',
                                      style: PoppinsStyle.stylePoppins(
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
                                    builder: (context) => ListDialog.contentDialog(
                                        context: context,
                                        imageName: 'read_dialog',
                                        message:
                                        'Sudah selesai membaca?\n${argument['uId'].toString().isEmpty ? 'Login untuk mendapatkan halaman selanjutnya!' : 'Ingin ulang membaca lagi?'}',
                                        cancelLabel: argument['uId'].toString().isEmpty ? 'Nanti Saja' : 'Ulangi Membaca',
                                        onCancel: () {
                                          Get.back();
                                        },
                                        successLabel: argument['uId'].toString().isEmpty ? 'Login' : 'Ayo Bercerita',
                                        onSuccess: () async{
                                          Get.back();
                                          if(argument['uId'].toString().isEmpty){
                                            Get.offNamedUntil(RouteName.dashboard, ModalRoute.withName(RouteName.dashboard));
                                            Get.toNamed(RouteName.loginSiswa);
                                          }else{
                                            showDialog(
                                              context: context,
                                              barrierDismissible: false,
                                              builder: (context) {
                                                return const Center(
                                                  child: CircularProgressIndicator(),
                                                );
                                              }
                                            );
                                            readController.ss.createScoringTemplate(argument: argument).then((value){
                                              Get.back();
                                              argument['isFinishedRead'] = value;
                                              if(value){
                                                Get.offAllNamed(RouteName.dashboard);
                                                Get.reload();
                                                Get.toNamed(
                                                  RouteName.detailContentPage,
                                                  arguments: argument,
                                                );
                                                Get.toNamed(
                                                  RouteName.warmUpPage,
                                                  arguments: argument,
                                                );
                                              }else{
                                                Get.snackbar(
                                                  'Gagal',
                                                  'Koneksi terputus! Harap cek jaringan lalu coba lagi.',
                                                );
                                              }
                                            });
                                          }
                                        }),
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
                ),
              ),
            ],
          ),
        ),
    );
  }
}
