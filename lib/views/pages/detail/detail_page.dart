import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/constants/constant_text_style.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/views/controllers/dashboard_controller.dart';
import 'package:tarali/views/widgets/background_widget.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final argument = Get.arguments;
    final String title = argument?['title'] ?? 'Detail';
    final DashboardController dashboardController = Get.put(DashboardController());

    return Scaffold(
      body: BackgroundWidget.setMainBackground(
        context: context,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 5,
          ),
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
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    title,
                    style: PoppinsStyle.stylePoppins(
                      color: blackText,
                      fontSize: 22,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w800,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.7,
                        padding: const EdgeInsets.all(20),
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
                            ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FutureBuilder<String>(
                            future: dashboardController.cs.getDetailCover(argument['pathStorage']),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              return Image.network(
                                snapshot.data!,
                                fit: BoxFit.fill,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  (loadingProgress
                                                      .expectedTotalBytes!)
                                              : null,
                                    ),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) => const Center(child: Icon(Icons.error)),
                              );
                            },
                          ),
                        )
                        ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          ElevatedButton.icon(
                            onPressed: () async {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  });
                              argument['imageUrl'] = await dashboardController.cs.getDetailCover(argument['pathStorage']);
                              argument['readContent'] = await dashboardController.cs.getAllReadContent(
                                path: argument['pathStorage'],
                                totalPage: argument['pageTotal'],
                              );
                              argument['warmUpBefore'] =
                                  await dashboardController.cs
                                      .getWarmUpImageBefore(
                                          argument['pathStorage']);
                              argument['warmUpAfter'] =
                                  await dashboardController.cs
                                      .getWarmUpImageAfter(
                                          argument['pathStorage']);
                              if (!context.mounted) return;
                              Navigator.of(context).pop();
                              Get.toNamed(
                                RouteName.readContentPage,
                                arguments: argument,
                              );
                            },
                            icon: const Icon(
                              Icons.menu_book,
                              size: 28,
                              color: Colors.black,
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            label:  Text(
                              'Baca',
                              textAlign: TextAlign.left,
                              style: PoppinsStyle.stylePoppins(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton.icon(
                            onPressed: () async {
                              String url = await dashboardController.cs.getAudioUrl(argument['pathStorage']);
                              argument['audioUrl'] = url;
                              Get.toNamed(
                                RouteName.audioContentPage,
                                arguments: argument,
                              );
                            },
                            icon: const Icon(
                              Icons.headphones_rounded,
                              size: 28,
                              color: Colors.black,
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            label:  Text(
                              'Dengar',
                              textAlign: TextAlign.left,
                              style: PoppinsStyle.stylePoppins(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton.icon(
                            onPressed: () async {
                              try {
                                String url = await dashboardController.cs.getVideoUrl(argument['pathStorage']);
                                argument['videoUrl'] = url;
                                Get.toNamed(
                                  RouteName.videoContentPage,
                                  arguments: argument,
                                );
                              } catch (e) {
                                log(e.toString());
                              }
                            },
                            icon: const Icon(
                              Icons.ondemand_video,
                              size: 28,
                              color: Colors.black,
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            label: Text(
                              'Tonton',
                              textAlign: TextAlign.left,
                              style: PoppinsStyle.stylePoppins(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton.icon(
                            onPressed: () async {
                              if(argument['isFinishedRead'] || argument['role'] == 1){
                                showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    });
                                argument['warmUpBefore'] =
                                await dashboardController.cs
                                    .getWarmUpImageBefore(
                                    argument['pathStorage']);
                                argument['warmUpAfter'] =
                                await dashboardController.cs
                                    .getWarmUpImageAfter(
                                    argument['pathStorage']);
                                if (!context.mounted) return;
                                Navigator.of(context).pop();
                                Get.toNamed(
                                  RouteName.warmUpPage,
                                  arguments: argument,
                                );
                              }else{
                                Get.snackbar(
                                  backgroundColor: Colors.red,
                                  duration: const Duration(seconds: 2),
                                  colorText: Colors.white,
                                  'Gagal',
                                  'Selesaikan baca buku terlebih dahulu untuk masuk kedalam "Ayo Bercerita"',
                                );
                              }
                            },
                            icon: Icon(
                              Icons.voicemail,
                              size: 28,
                              color: argument['isFinishedRead'] || argument['role'] == 1 ? Colors.lightBlue : greyText,
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            label: Text(
                              'Ayo Bercerita',
                              textAlign: TextAlign.left,
                              style: PoppinsStyle.stylePoppins(
                                fontSize: 14,
                                color: argument['isFinishedRead'] || argument['role'] == 1 ? Colors.lightBlue : greyText,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              if(argument['isFinishedQuiz'] || argument['role'] == 1){
                                Get.toNamed(
                                  RouteName.quizAnswerPage,
                                  arguments: argument,
                                );
                              }
                              else if(argument['isFinishedReadTest'] || argument['role'] == 1){
                                 Get.toNamed(
                                  RouteName.quizPage,
                                  arguments: argument,
                                );
                              }
                              else{
                                Get.snackbar(
                                  backgroundColor: Colors.red,
                                  duration: const Duration(seconds: 2),
                                  colorText: Colors.white,
                                  'Gagal',
                                  'Selesaikan "Ayo Bercerita" terlebih dahulu untuk masuk kedalam Quiz.',
                                );
                              }
                            },
                            icon: Icon(
                              Icons.edit,
                              size: 28,
                              color: argument['isFinishedReadTest'] || argument['role'] == 1 ? Colors.lightBlue : greyText,
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            label: Text(
                              'Kuis',
                              textAlign: TextAlign.left,
                              style: PoppinsStyle.stylePoppins(
                                fontSize: 14,
                                color: argument['isFinishedReadTest'] || argument['role'] == 1 ? Colors.lightBlue : greyText,
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
      ),
    );
  }
}
