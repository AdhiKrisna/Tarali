import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/views/widgets/background_screen.dart';

class DetailToScoringPage extends StatelessWidget {
  const DetailToScoringPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String title = Get.arguments;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03),
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Get.back(),
        ),
        title: Text(
          title,
          style: const TextStyle(
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
                            const Text(
                              "Urutkan Berdasarkan",
                              style: TextStyle(
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
                                Get.back();
                              },
                            ),
                            ListTile(
                              visualDensity: const VisualDensity(vertical: -4),
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Absen'),
                              onTap: () {
                                Get.back();
                              },
                            ),
                            ListTile(
                              visualDensity: const VisualDensity(vertical: -4),
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Diperiksa'),
                              onTap: () {
                                Get.back();
                              },
                            ),
                            ListTile(
                              visualDensity: const VisualDensity(vertical: -4),
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Belum Diperiksa'),
                              onTap: () {
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
      body: Stack(
        children: [
          const BackgroundScreenWidget(),
          SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.01,
                vertical: MediaQuery.of(context).size.height * 0.0125,
              ),
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  index++;
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
                                MediaQuery.of(context).size.width * 0.016),
                            child: Text(
                              '$index',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.02,
                                fontWeight: FontWeight.bold,
                                color: white,
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          'Nama $index',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.01),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: lightBlue,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.025,
                                      ),
                                      Text(
                                        index == 1
                                            ? '100'
                                            : index == 3
                                                ? '80'
                                                : '-',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context)
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
                                width: MediaQuery.of(context).size.width * 0.01,
                              ),
                              Container(
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.01),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.access_time_filled,
                                        color: lightBlue,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.025,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01,
                                      ),
                                      Text(
                                        index == 2
                                            ? '7:17'
                                            : index == 4
                                                ? '5:14'
                                                : '3:30',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context)
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
                                width: MediaQuery.of(context).size.width * 0.01,
                              ),
                              SizedBox(
                                height: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () => Get.toNamed(
                                    RouteName.scoringPage,
                                    arguments: 'Nama $index',
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.02),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    disabledBackgroundColor: lightBlue,
                                    backgroundColor: lightBlue,
                                  ),
                                  child: Text(
                                    'Periksa',
                                    style: TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
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
                                MediaQuery.of(context).size.width * 0.025),
                        child: const Divider(
                          thickness: 1,
                          color: bgBlue,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
