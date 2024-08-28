import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/views/controllers/toggle_controller.dart';
import 'package:tarali/views/widgets/background_screen2.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ToggleController toggleController = Get.put(ToggleController());
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            const BackgroundScreenWidget2(),
            Container(
              width: MediaQuery.of(context).size.width * 0.94,
              height: MediaQuery.of(context).size.height * 0.85,
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.15,
                right: MediaQuery.of(context).size.width * 0.02,
                left: MediaQuery.of(context).size.width * 0.02,
              ),
              child: Column(
                children: [
                  Obx(() {
                    if (toggleController.isSearching.isTrue) {
                      return Row(
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
                            onPressed: toggleController.toggleSearch,
                            child: Icon(
                              size: MediaQuery.of(context).size.width < 760
                                  ? MediaQuery.of(context).size.width * 0.035
                                  : MediaQuery.of(context).size.width * 0.030,
                              Icons.arrow_back_ios_new_sharp,
                              color: Colors.black,
                            ),
                          ),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 1000),
                            transitionBuilder: (child, animation) {
                              return ScaleTransition(
                                scale: animation,
                                child: child,
                              );
                            },
                            child: AnimatedContainer(
                                duration: const Duration(milliseconds: 5000),
                                curve: Curves.easeInOut,
                                key: ValueKey<bool>(
                                    toggleController.isSearching.value),
                                width: MediaQuery.of(context).size.width * 0.84,
                                height: MediaQuery.of(context).size.height < 760
                                    ? MediaQuery.of(context).size.height * 0.120
                                    : MediaQuery.of(context).size.height *
                                        0.125,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: TextFormField(
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: IconButton(
                                      icon: const Icon(Icons.search),
                                      onPressed: () {},
                                    ),
                                    suffixIcon: IconButton(
                                      icon: const Icon(Icons.mic_none),
                                      onPressed: () {},
                                    ),
                                    hintText: 'Cari buku yang ingin kamu baca',
                                  ),
                                )),
                          ),
                        ],
                      );
                    } else {
                      return Row(
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
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    alignment: Alignment.topLeft,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    content: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
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
                                            visualDensity: const VisualDensity(vertical: -3),
                                            contentPadding: EdgeInsets.zero,
                                            leading: const Icon(Icons.history),
                                            title: const Text('Riwayat'),
                                            onTap: () => Get.toNamed(RouteName.history),
                                          ),
                                          ListTile(
                                            visualDensity: const VisualDensity(vertical: -3),
                                            contentPadding: EdgeInsets.zero,
                                            leading: const Icon(Icons.edit),
                                            title:
                                                const Text('Nilai Tes Membaca'),
                                            onTap: () => Get.back(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Icon(
                              size: MediaQuery.of(context).size.width < 760
                                  ? MediaQuery.of(context).size.width * 0.035
                                  : MediaQuery.of(context).size.width * 0.030,
                              Icons.menu,
                              color: Colors.black,
                            ),
                          ),
                          const Text(
                            'Yuk, baca dan temukan pengetahuan baru!',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ElevatedButton(
                            clipBehavior: Clip.antiAlias,
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.width * 0.016),
                              disabledBackgroundColor: white,
                              backgroundColor: white,
                              shape: const CircleBorder(),
                            ),
                            onPressed: toggleController.toggleSearch,
                            child: Icon(
                              size: MediaQuery.of(context).size.width < 760
                                  ? MediaQuery.of(context).size.width * 0.035
                                  : MediaQuery.of(context).size.width * 0.030,
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      );
                    }
                  }),
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
                                right:
                                    MediaQuery.of(context).size.width * 0.025),
                            width: MediaQuery.of(context).size.width < 760
                                ? MediaQuery.of(context).size.width * 0.2
                                : MediaQuery.of(context).size.width * 0.165,
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
                                    height:
                                        MediaQuery.of(context).size.height *
                                            0.45,
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                          MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01),
                                      child: Image.asset(
                                        'assets/images/cover_detail.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Text(
                                        'Kisah Leak Bali 1 2 3 4 5 ',
                                        style: TextStyle(
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
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
