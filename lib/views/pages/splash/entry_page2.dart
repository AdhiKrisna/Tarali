import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/views/controllers/entry_controller.dart';
import 'package:tarali/views/widgets/background_widget.dart';
import 'package:tarali/constants/constant_text_style.dart';


class EntryPage2 extends StatelessWidget {
  const EntryPage2({super.key});
@override
  Widget build(BuildContext context) {
    final EntryController entryController = Get.find();
    entryController.showSplash2();
    return Scaffold(
      body: BackgroundWidget.setMainBackground(
        padding: 0,
        context: context,
        child: Center(
          child: Obx(
            () => Container(
              width: MediaQuery.of(context).size.width * 0.975,
              height: MediaQuery.of(context).size.height * 0.6,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(
                    style: BorderStyle.solid,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                    ),
                  ]),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1500),
                opacity: entryController.opacity.value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Ilustrator',
                          style: PoppinsStyle.stylePoppins(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: blackText,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'I Nyoman Bagus Dharma Sidhi',
                          style: PoppinsStyle.stylePoppins(
                            fontSize: 15,
                            color: blackText,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Ida Bagus Putu Rama Wiguna',
                          style: PoppinsStyle.stylePoppins(
                            fontSize: 15,
                            color: blackText,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const  SizedBox(
                          height: 10,
                        ),
                         Text(
                          'Pengisi Suara',
                          style: PoppinsStyle.stylePoppins(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: blackText,
                          ),
                        ),
                         Text(
                          'Komang Ayu Tantri Sastra Dewi',
                          style: PoppinsStyle.stylePoppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: blackText,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Nama Team',
                          style: PoppinsStyle.stylePoppins(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: blackText,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                       
                        Text(
                          'ITC',
                          style: PoppinsStyle.stylePoppins(
                            fontSize: 15,
                            color: blackText,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Information Technology Club',
                          style: PoppinsStyle.stylePoppins(
                            fontSize: 15,
                            color: blackText,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'App Developer',
                          style: PoppinsStyle.stylePoppins(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: blackText,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Made Vidyatma Adhi Krisna',
                          style: PoppinsStyle.stylePoppins(
                            fontSize: 15,
                            color: blackText,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Diandra Yusuf Arrafi',
                          style: PoppinsStyle.stylePoppins(
                            fontSize: 15,
                            color: blackText,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const  SizedBox(
                          height: 10,
                        ),
                         Text(
                          'UI/UX Designer',
                          style: PoppinsStyle.stylePoppins(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: blackText,
                          ),
                        ),
                         Text(
                          'Nolan Tabina',
                          style: PoppinsStyle.stylePoppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: blackText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}