import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/constants/constant_text_style.dart';
import 'package:tarali/models/content_model.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/services/music_service.dart';
// import 'package:tarali/services/music_service.dart';
import 'package:tarali/services/user_service.dart';
import 'package:tarali/views/controllers/dashboard_controller.dart';
import 'package:tarali/views/widgets/background_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController = Get.put(DashboardController());
    final audioService = Get.find<AudioService>();
    dashboardController.getUserData();
    final UserService authService = UserService();
    return Scaffold(
      body: BackgroundWidget.setMainBackground(
        context: context,
        child: ListView(
          shrinkWrap: true,
          children: [
            Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.016),
                          disabledBackgroundColor: Colors.white,
                          backgroundColor: Colors.white,
                          shape: const CircleBorder(),
                        ),
                        onPressed: dashboardController.isSearching.isTrue
                            ? () {
                          audioService.audioPlayer.resume();
                          dashboardController.searchController.text = '';
                          dashboardController.searchContent(value: '');
                          dashboardController.toggleSearch();
                        }
                            : () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              AnimationController animatedController =
                              AnimationController(
                                duration: const Duration(
                                    milliseconds: 300), // Animation duration
                                vsync:
                                Navigator.of(context), // TickerProvider
                              );
                              Animation<Offset> offsetAnimation =
                              Tween<Offset>(
                                begin: const Offset(
                                    -1.0, 0.0), // Start from the left side
                                end: Offset
                                    .zero, // End at the original position
                              ).animate(CurvedAnimation(
                                parent: animatedController,
                                curve: Curves.easeInOut,
                              ));
                              animatedController.forward();
                              return Obx(() {
                                final data = dashboardController.authStreamResult.value;
                                if(data == null){
                                  return const Center(child: CircularProgressIndicator());
                                }else{
                                  final authUser = data["authUser"] as User?;
                                  final userData = data["userData"] as Map<String, dynamic>?;
                                  return SlideTransition(
                                    position: offsetAnimation,
                                    child: AlertDialog(
                                      alignment: Alignment.topLeft,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      content: SizedBox(
                                        height:
                                        MediaQuery.of(context).size.height *
                                            0.6,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            authUser != null ?
                                            Text(
                                              "Halo, ${authUser.displayName ?? authUser.email}\n${userData?['role'] == 1 ?
                                              'Guru di ${userData?['sekolah'] ?? ' Sekolah ini'}'
                                                  :
                                              'Murid di ${userData?['sekolah'] ?? ' Sekolah ini'}'}",
                                              style: PoppinsStyle.stylePoppins(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ) :
                                            ListTile(
                                              visualDensity: const VisualDensity(
                                                vertical: -3,
                                              ),
                                              contentPadding: EdgeInsets.zero,
                                              leading: const Icon(Icons.login),
                                              title: const Text('Login'),
                                              onTap: () {
                                                audioService.audioPlayer.pause();
                                                Get.back();
                                                Get.toNamed(RouteName.loginSiswa);
                                              },
                                            ),
                                            const Divider(color: Colors.black),
                                            authUser != null ?
                                            ListTile(
                                              visualDensity: const VisualDensity(
                                                vertical: -3,
                                              ),
                                              contentPadding: EdgeInsets.zero,
                                              leading: const Icon(Icons.history),
                                              title: const Text('Riwayat'),
                                              onTap: () {
                                                audioService.audioPlayer.pause();
                                                Get.back();
                                                Get.toNamed(
                                                  RouteName.history,
                                                  arguments: dashboardController.userModel.toMap(),
                                                );
                                              },
                                            ) : Container(),
                                            userData?['role'] == 1 ?
                                            ListTile(
                                              visualDensity: const VisualDensity(
                                                vertical: -3,
                                              ),
                                              contentPadding: EdgeInsets.zero,
                                              leading: const Icon(Icons.edit),
                                              title:
                                              const Text('Nilai Tes Membaca'),
                                              onTap: () {
                                                audioService.audioPlayer.pause();
                                                Get.back();
                                                Get.toNamed(
                                                  RouteName.toScoringPage,
                                                  arguments: dashboardController.userModel.toMap(),
                                                );
                                              },
                                            ) : Container(),
                                            authUser != null ?
                                            ListTile(
                                              visualDensity: const VisualDensity(
                                                vertical: -3,
                                              ),
                                              contentPadding: EdgeInsets.zero,
                                              leading: const Icon(Icons.logout),
                                              title:
                                              const Text('Logout'),
                                              onTap: () async{
                                                Get.defaultDialog(
                                                  title: "Konfirmasi Logout",
                                                  middleText: "Apakah Anda yakin ingin logout?",
                                                  textCancel: "Tidak",
                                                  textConfirm: "Ya",
                                                  barrierDismissible: false,
                                                  confirmTextColor: Colors.white,
                                                  cancelTextColor: blackText,
                                                  buttonColor: lightBlue,
                                                  onCancel: () {},
                                                  onConfirm: ()async {
                                                    Get.back();
                                                    Get.back();
                                                    await authService.logout(); // Panggil fungsi logout
                                                    Get.reload();
                                                    Get.snackbar(
                                                      backgroundColor: Colors.green,
                                                      colorText: Colors.white,
                                                      snackPosition: SnackPosition.BOTTOM,
                                                      'Sukses',
                                                      'Anda berhasil logout.',
                                                    );
                                                  },
                                                );
                                              },
                                            ) :
                                            Container(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              });
                            },
                          );
                        },
                        child: Icon(
                          dashboardController.isSearching.isTrue
                              ? Icons.arrow_back_ios_new_sharp
                              : Icons.menu,
                          size: MediaQuery.of(context).size.width < 760
                              ? MediaQuery.of(context).size.width * 0.035
                              : MediaQuery.of(context).size.width * 0.030,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                             Padding(
                              padding: const EdgeInsets.only(right: 50),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Yuk, baca dan temukan pengetahuan baru!',
                                  style: PoppinsStyle.stylePoppins(
                                    color: Colors.black,
                                    fontSize: MediaQuery.of(context).size.width * 0.025,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 350),
                                width: dashboardController.isSearching.isTrue
                                    ? MediaQuery.of(context).size.width * 0.875
                                    : MediaQuery.of(context).size.width * 0.055,
                                alignment: Alignment.topLeft,
                                decoration: BoxDecoration(
                                  color: dashboardController.isSearching.isTrue
                                      ? Colors.white
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(360),
                                ),
                                child: dashboardController.isSearching.isTrue
                                    ?
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.only(left: 8),
                                        child: TextField(
                                          onSubmitted: (value) {
                                            dashboardController.searchContent(value: value);
                                          },
                                          controller: dashboardController
                                              .searchController,
                                          decoration: InputDecoration(
                                            hintText: dashboardController.isListening.isTrue && dashboardController.speechToText.isListening
                                                ? 'Mendengarkan...'
                                                : 'Cari judul buku',
                                            border: InputBorder.none,
                                            prefixIcon: IconButton(
                                              icon: const Icon(
                                                Icons.search,
                                                color: Colors.black,
                                              ),
                                              onPressed: () => dashboardController.searchContent(value: dashboardController.searchController.text),
                                              color: Colors.black,
                                            ),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                dashboardController.isListening.isTrue
                                                    ? Icons.cancel
                                                    : Icons.mic,
                                                color: Colors.black,
                                              ),
                                              onPressed: () {
                                                audioService.audioPlayer.pause();
                                                dashboardController.isListening.isTrue && dashboardController.speechToText.isListening
                                                    ? dashboardController.stopListening()
                                                    : dashboardController.startListening();
                                              },
                                              iconSize: MediaQuery.of(context)
                                                  .size
                                                  .width <
                                                  760
                                                  ? MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.035
                                                  : MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.030,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                                    :
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: MediaQuery.of(context)
                                            .size
                                            .width *
                                            0.01,
                                        vertical: MediaQuery.of(context)
                                            .size
                                            .width *
                                            0.01),
                                    disabledBackgroundColor: Colors.white,
                                    backgroundColor: Colors.white,
                                    shape: const CircleBorder(),
                                  ),
                                  onPressed: dashboardController.toggleSearch,
                                  child: Icon(
                                    Icons.search,
                                    size: MediaQuery.of(context).size.width *
                                        0.03875,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.55,
              child: StreamBuilder(
                stream: dashboardController.cs.getAllContent(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Obx((){
                    List<ContentModel> data = dashboardController.cs
                        .getAllContentData(data: snapshot.data!.docs);
                    data = data.where((element) => element.title.toLowerCase().contains(dashboardController.searchData.value.toLowerCase())).toList();
                    return data.isEmpty
                        ? const Center(child: Text("Judul Buku Tidak Ditemukan"))
                        : ListView(
                      scrollDirection: Axis.horizontal,
                      children: data.map((e) {
                        return Container(
                          margin: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width *
                                  0.0225),
                          width: MediaQuery.of(context).size.width < 760
                              ? MediaQuery.of(context).size.width * 0.215
                              : MediaQuery.of(context).size.width * 0.17,
                          decoration: BoxDecoration(
                            border: Border.all(
                              style: BorderStyle.solid,
                              color: white,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ],
                          ),
                          child: InkWell(
                            onTap: () async{
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              );
                              var args = Map.from(e.toMap())..addAll(dashboardController.userModel.toMap());
                              args['isFinishedRead'] = await dashboardController.ss.checkCanReadTest(
                                uid: args['uId'],
                                contentId: args['contentId'],
                              );
                              args['isFinishedReadTest'] = await dashboardController.ss.checkCanQuiz(
                                uid: args['uId'],
                                contentId: args['contentId'],
                              );
                              args['isFinishedQuiz'] = await dashboardController.ss.checkQuizDone(
                                uid: args['uId'],
                                contentId: args['contentId'],
                              );
                              if (!context.mounted) return;
                              audioService.audioPlayer.pause();
                              Get.back();
                              Get.toNamed(
                                RouteName.detailContentPage,
                                arguments: args,
                              );
                            },
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height:
                                  MediaQuery.of(context).size.height *
                                      0.45,
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        MediaQuery.of(context).size.width *
                                            0.01),
                                    child: Image.network(
                                      e.coverDashboard,
                                      fit: BoxFit.fill,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent?
                                          loadingProgress) {
                                        if (loadingProgress == null){
                                          return child;
                                        }
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                .expectedTotalBytes !=
                                                null
                                                ? loadingProgress
                                                .cumulativeBytesLoaded /
                                                (loadingProgress
                                                    .expectedTotalBytes!)
                                                : null,
                                          ),
                                        );
                                      },
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                      const Center(
                                          child: Icon(Icons.error)),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Text(
                                      e.title,
                                      style: PoppinsStyle.stylePoppins(
                                        color: white,
                                        fontSize: MediaQuery.of(context)
                                            .size
                                            .width *
                                            0.02,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}