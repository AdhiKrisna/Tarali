import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/views/widgets/background_widget.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String title = Get.arguments is List<String> ? Get.arguments[0] ?? 'Judul Cerita' : Get.arguments ?? 'Judul Cerita';

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
                    style: const TextStyle(
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
                          child: Image.asset(
                            'assets/images/cover_detail.png',
                            fit: BoxFit.cover,
                          ),
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              Get.toNamed(
                                RouteName.readContentPage,
                                arguments: title,
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
                            label: const Text(
                              'Baca',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              Get.toNamed(
                                RouteName.audioContentPage,
                                arguments: title,
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
                            label: const Text(
                              'Dengar',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton.icon(
                            onPressed: () async{
                              final storageRef = FirebaseStorage.instance.ref();
                              String url = await storageRef.child("konten/selatbali/video/video.mp4").getDownloadURL();
                              Get.toNamed(
                                RouteName.videoContentPage,
                                arguments: [
                                  title,
                                  url,
                                ],
                              );
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
                            label: const Text(
                              'Tonton',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              Get.toNamed(
                                RouteName.warmUpPage, arguments: title);
                            },
                            icon: const Icon(
                              Icons.voicemail,
                              size: 28,
                              color: Colors.lightBlue,
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            label: const Text(
                              'Ayo Bercerita',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.lightBlue,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              Get.toNamed(RouteName.quizPage, arguments: title);
                            },
                            icon: const Icon(
                              Icons.edit,
                              size: 28,
                              color: Colors.grey,
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            label: const Text(
                              'Kuis',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
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
