import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/views/widgets/background_screen2.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Builder(builder: (context) {
                        double btnSize =
                            MediaQuery.of(context).size.width * 0.08;
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(btnSize * 0.2),
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
                                    height: MediaQuery.of(context).size.height * 0.45,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                          contentPadding: EdgeInsets.zero,
                                          leading: const Icon(Icons.history),
                                          title: const Text('Riwayat'),
                                          onTap: () {
                                            Navigator.of(context).pop(); 
                                          },
                                        ),
                                        ListTile(
                                          contentPadding: EdgeInsets.zero,
                                          leading: const Icon(Icons.edit),
                                          title: const Text('Nilai Tes Membaca'),
                                          onTap: () {
                                            Navigator.of(context).pop(); 
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
                            size: btnSize * 0.4,
                            Icons.menu,
                            color: Colors.black,
                          ),
                        );
                      }),
                      const Text(
                        'Yuk, baca dan temukan pengetahuan baru!',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          double btnSize =
                              MediaQuery.of(context).size.width * 0.08;
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(btnSize * 0.2),
                              disabledBackgroundColor: white,
                              backgroundColor: white,
                              shape: const CircleBorder(),
                            ),
                            onPressed: null,
                            child: Icon(
                              size: btnSize * 0.4,
                              Icons.search,
                              color: Colors.black,
                            ),
                          );
                        },
                      ),
                    ],
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
                            margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.025),
                            width: MediaQuery.of(context).size.width < 760 ? MediaQuery.of(context).size.width * 0.2 : MediaQuery.of(context).size.width * 0.165,
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
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(RouteName.splash);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
                                    child: Image.asset(
                                      'assets/images/cover1.png',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Center(
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed(RouteName.splash);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Text(
                                        'Kisah Leak Bali 1 2 3 4 5 ',
                                        style: TextStyle(
                                          color: white,
                                          fontSize: MediaQuery.of(context).size.width * 0.02,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                              ],
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
