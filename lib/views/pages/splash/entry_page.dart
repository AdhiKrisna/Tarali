import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/constants/constant_text_style.dart';
import 'package:tarali/views/controllers/entry_controller.dart';
import 'package:tarali/views/widgets/background_widget.dart';

class EntryPage extends StatelessWidget {
  const EntryPage({super.key});
  @override
  Widget build(BuildContext context) {
    final EntryController entryController = Get.put(EntryController());
    entryController.showSplash();
    return Scaffold(
      body: BackgroundWidget.setMainBackground(
        padding: 0,
        context: context,
        child: Center(
          child: Obx(
            () => Container(
              width: MediaQuery.of(context).size.width * 0.975,
              height: MediaQuery.of(context).size.height * 0.9,
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
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 1500),
                    opacity: entryController.opacity.value,
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.height * 0.5,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/pembimbing1.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Pembimbing I',
                                style: PoppinsStyle.stylePoppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: blackText,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Prof. Dr. I Made Ardana, M.Pd.',
                                style: PoppinsStyle.stylePoppins(
                                  fontSize:  MediaQuery.of(context).size.width * 0.015,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '196208271989031001',
                                style: PoppinsStyle.stylePoppins(
                                  fontSize:  MediaQuery.of(context).size.width * 0.015,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 1500),
                    opacity: entryController.opacity.value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.height * 0.5,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/pengembang.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Pengembang',
                                style: PoppinsStyle.stylePoppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: blackText,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Komang Ayu Tantri Sastra Dewi',
                                    style: PoppinsStyle.stylePoppins(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.015,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    'NIM : 2329041006',
                                    style: PoppinsStyle.stylePoppins(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.015,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 7.5),
                                  Text(
                                    'Mahasiswa Program Pascasarjana',
                                    style: PoppinsStyle.stylePoppins(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.015,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    'Program Studi Pendidikan Dasar',
                                    style: PoppinsStyle.stylePoppins(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.015,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    'Universitas Pendidikan Ganesha',
                                    style: PoppinsStyle.stylePoppins(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.015,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 1500),
                    opacity: entryController.opacity.value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                          Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.height * 0.5,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/pembimbing2.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Pembimbing II',
                                style: PoppinsStyle.stylePoppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: blackText,
                                ),
                              ),
                              const SizedBox(height: 7.5),
                              Text(
                                'Prof. Dr. I Nyoman Jampel, M.Pd.',
                                style: PoppinsStyle.stylePoppins(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.015,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 2),

                              Text(
                                '195910101986031003',
                                style: PoppinsStyle.stylePoppins(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.015,
                                  fontWeight: FontWeight.bold,
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
        ),
      ),
    );
  }
}
