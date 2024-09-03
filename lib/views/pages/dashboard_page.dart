import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/views/controllers/toggle_controller.dart';
import 'package:tarali/views/widgets/background_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController = Get.put(
      DashboardController(),
    );
    return Scaffold(
      body: BackgorundWidget.setMainBackground(
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
                        ? dashboardController.toggleSearch
                        : () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  alignment: Alignment.topLeft,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  content: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.42,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Halo,\nAdhi Krisna!",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        const Divider(color: Colors.black),
                                        ListTile(
                                          visualDensity:
                                              const VisualDensity(vertical: -3),
                                          contentPadding: EdgeInsets.zero,
                                          leading: const Icon(Icons.history),
                                          title: const Text('Riwayat'),
                                          onTap: () {
                                            Get.back();
                                            Get.toNamed(RouteName.history);
                                          },
                                        ),
                                        ListTile(
                                          visualDensity:
                                              const VisualDensity(vertical: -3),
                                          contentPadding: EdgeInsets.zero,
                                          leading: const Icon(Icons.edit),
                                          title:
                                              const Text('Nilai Tes Membaca'),
                                          onTap: () {
                                            Get.back();
                                            Get.toNamed(
                                                RouteName.toScoringPage);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
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
                        const Padding(
                          padding: EdgeInsets.only(right: 50),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Yuk, baca dan temukan pengetahuan baru!',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            width: dashboardController.isSearching.isTrue
                                ? MediaQuery.of(context).size.width * 0.84
                                : MediaQuery.of(context).size.width * 0.055,
                            alignment: Alignment.topLeft,
                            decoration: BoxDecoration(
                              color: dashboardController.isSearching.isTrue
                                  ? Colors.white
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(360),
                            ),
                            child: dashboardController.isSearching.isTrue
                                ? Row(
                                    children: [
                                      const Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 8),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: 'Search...',
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        style: IconButton.styleFrom(
                                          padding: EdgeInsets.all(
                                            MediaQuery.of(context).size.width *
                                                0.01,
                                          ),
                                          disabledBackgroundColor: Colors.white,
                                          backgroundColor: Colors.white,
                                          shape: const CircleBorder(),
                                        ),
                                        icon: Icon(
                                          Icons.mic,
                                          size: MediaQuery.of(context)
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
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  )
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.all(
                                        MediaQuery.of(context).size.width *
                                            0.016,
                                      ),
                                      backgroundColor: white,
                                      shape: const CircleBorder(),
                                    ),
                                    onPressed: dashboardController.toggleSearch,
                                    child: Icon(
                                      size: MediaQuery.of(context).size.width <
                                              760
                                          ? MediaQuery.of(context).size.width *
                                              0.035
                                          : MediaQuery.of(context).size.width *
                                              0.030,
                                      color: Colors.black,
                                      Icons.search,
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
              child: Builder(builder: (context) {
                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    6,
                    (index) => Container(
                      margin: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.025),
                      width: MediaQuery.of(context).size.width < 760
                          ? MediaQuery.of(context).size.width * 0.2
                          : MediaQuery.of(context).size.width * 0.16,
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
                        onTap: () {
                          Get.toNamed(RouteName.splash);
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.45,
                              child: Padding(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.width * 0.01),
                                child: Image.asset(
                                  'assets/images/cover_detail.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  'Kisah Leak Bali 1 2 3 4 5 ',
                                  style: TextStyle(
                                    color: white,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
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
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
