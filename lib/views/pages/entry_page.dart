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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          image:
                              const AssetImage('assets/images/pembimbing1.jpg'),
                          width: MediaQuery.of(context).size.width * 0.275,
                          height: MediaQuery.of(context).size.height * 0.65,
                          fit: BoxFit.cover,
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
                                'Pembimbing I',
                                style: PoppinsStyle.stylePoppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: blackText,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Nama : Prof. Dr. I Made Ardana, M.Pd.\nNIP : 196208271989031001',
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
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 1500),
                    opacity: entryController.opacity.value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                          image:
                              const AssetImage('assets/images/pengembang.jpg'),
                          width: MediaQuery.of(context).size.width * 0.275,
                          height: MediaQuery.of(context).size.height * 0.55,
                          fit: BoxFit.cover,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nama : Komang Ayu Tantri Sastra Dewi\nNIM : 2329041006',
                                    style: PoppinsStyle.stylePoppins(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.015,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Mahasiswa Pascasarjana\nProgram Studi Pendidikan Dasar\nUniversitas Pendidikan Ganesha',
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
                        Image(
                          image:
                              const AssetImage('assets/images/pembimbing2.jpg'),
                          width: MediaQuery.of(context).size.width * 0.275,
                          height: MediaQuery.of(context).size.height * 0.65,
                          fit: BoxFit.cover,
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
                              const SizedBox(height: 10),
                              Text(
                                'Prof. Dr. I Nyoman Jampel, M.Pd.\nNIP : 195910101986031003',
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
