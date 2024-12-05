import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/constants/constant_text_style.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/services/scoring_service.dart';
import 'package:tarali/models/scoring_model.dart';
import 'package:tarali/views/controllers/scoring/to_scoring_controller.dart';
import 'package:tarali/views/widgets/background_widget.dart';

class DetailToScoringPage extends StatelessWidget {
  const DetailToScoringPage({super.key});

  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments;
    final String title = arguments['title'];
    ToScoringController scoringController = Get.put(ToScoringController());
    final ss = ScoringService();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.03),
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Get.back();
            }),
        title: Text(
          title,
          style: PoppinsStyle.stylePoppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.03,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.016),
                disabledBackgroundColor: Colors.white,
                backgroundColor: Colors.white,
                shape: const CircleBorder(),
              ),
              onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  AnimationController animatedController = AnimationController(
                    duration:
                        const Duration(milliseconds: 300), // Animation duration
                    vsync: Navigator.of(context), // TickerProvider
                  );

                  // Define the sliding animation (from right to left)
                  Animation<Offset> offsetAnimation = Tween<Offset>(
                    begin: const Offset(1.0, 0.0), // Start from the right side
                    end: Offset.zero, // End at the original position
                  ).animate(CurvedAnimation(
                    parent: animatedController,
                    curve: Curves.easeInOut,
                  ));
                  // Start the animation
                  animatedController.forward();

                  return SlideTransition(
                    position: offsetAnimation,
                    child: AlertDialog(
                      alignment: Alignment.topRight,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      content: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.55,
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Text(
                              "Urutkan Berdasarkan",
                              style: PoppinsStyle.stylePoppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const Divider(color: Colors.black),
                            ListTile(
                              visualDensity: const VisualDensity(vertical: -4),
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Nama'),
                              onTap: () {
                                scoringController.setSortBy(sortBy: 'nama');
                                Get.back();
                              },
                            ),
                            ListTile(
                              visualDensity: const VisualDensity(vertical: -4),
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Absen'),
                              onTap: () {
                                scoringController.setSortBy(sortBy: 'absen');
                                Get.back();
                              },
                            ),
                            ListTile(
                              visualDensity: const VisualDensity(vertical: -4),
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Diperiksa'),
                              onTap: () {
                                scoringController.setSortBy(sortBy: 'check');
                                Get.back();
                              },
                            ),
                            ListTile(
                              visualDensity: const VisualDensity(vertical: -4),
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Belum Diperiksa'),
                              onTap: () {
                                scoringController.setSortBy(sortBy: 'unCheck');
                                Get.back();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              child: Icon(
                Icons.filter_list,
                size: MediaQuery.of(context).size.width * 0.035,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: BackgroundWidget.setMeruBg(
        context: context,
        child: SafeArea(
          child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.01,
                vertical: MediaQuery.of(context).size.height * 0.0125,
              ),
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder(
                stream: ss.getAllReadTestAssignment(
                  contentId: arguments['contentId'],
                  sekolah: arguments['sekolah'],
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Obx(() {
                    List<ScoringModel> model = ss.getAllReadTestAssignmentData(
                        data: snapshot.data!.docs);
                    if (scoringController.sortBy.value == 'nama') {
                      model.sort((a, b) => a.nama.compareTo(b.nama));
                    } else if (scoringController.sortBy.value == 'check') {
                      model.sort(
                          (a, b) => b.readTestScore.compareTo(a.readTestScore));
                    } else if (scoringController.sortBy.value == 'unCheck') {
                      model.sort(
                          (a, b) => a.readTestScore.compareTo(b.readTestScore));
                    } else {
                      model.sort((a, b) => a.absen.compareTo(b.absen));
                    }
                    if (model.isNotEmpty) {
                      return ListView.builder(
                        itemCount: model.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                leading: Container(
                                  decoration: const BoxDecoration(
                                    color: lightBlue,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        MediaQuery.of(context).size.width *
                                            0.016),
                                    child: Text(
                                      model[index].absen.toString(),
                                      style: PoppinsStyle.stylePoppins(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        fontWeight: FontWeight.bold,
                                        color: white,
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  model[index].nama,
                                  style: PoppinsStyle.stylePoppins(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.025,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.12,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.01),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const ImageIcon(
                                                AssetImage(
                                                    'assets/icons/pencil.png'),
                                                color: lightBlue,
                                              ),
                                              Text(
                                                '${model[index].quizScore }',
                                                style:
                                                    PoppinsStyle.stylePoppins(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.0225,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01,
                                      ),
                                      Container(
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.01),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: lightBlue,
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.025,
                                              ),
                                              Text(
                                                '${model[index].readTestScore}',
                                                style:
                                                    PoppinsStyle.stylePoppins(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.0225,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01,
                                      ),
                                      Container(
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.01),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(
                                                Icons.access_time_filled,
                                                color: lightBlue,
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.025,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.01,
                                              ),
                                              Text(
                                                model[index].readTestDuration,
                                                style:
                                                    PoppinsStyle.stylePoppins(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.0225,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01,
                                      ),
                                      SizedBox(
                                        height: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: () => Get.toNamed(
                                            RouteName.scoringPage,
                                            arguments: model[index].toMap(),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.02),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            disabledBackgroundColor: lightBlue,
                                            backgroundColor: lightBlue,
                                          ),
                                          child: Text(
                                            'Periksa',
                                            style: PoppinsStyle.stylePoppins(
                                              color: white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.025,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.025),
                                child: const Divider(
                                  thickness: 1,
                                  color: bgBlue,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: Text(
                          'Tidak ada data yang akan dinilai.',
                        ),
                      );
                    }
                  });
                },
              )),
        ),
      ),
    );
  }
}
