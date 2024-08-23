import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/views/widgets/background_screen.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              const BackgroundScreenWidget(),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.85,
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1,
                  right: MediaQuery.of(context).size.width * 0.05,
                  left: MediaQuery.of(context).size.width * 0.05,
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
                              disabledBackgroundColor: lightBlue,
                              backgroundColor: lightBlue,
                              shape: const CircleBorder(),
                            ),
                            onPressed: null,
                            child: Icon(
                              size: btnSize * 0.4,
                              Icons.menu,
                              color: white,
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
                                disabledBackgroundColor: lightBlue,
                                backgroundColor: lightBlue,
                                shape: const CircleBorder(),
                              ),
                              onPressed: null,
                              child: Icon(
                                size: btnSize * 0.4,
                                Icons.search,
                                color: white,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Builder(builder: (context) {
                        return ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            6,
                            (index) => Container(
                              margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.025),
                              width: MediaQuery.of(context).size.width * 0.16,
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(RouteName.splash);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Image.asset(
                                        'assets/images/cover1.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Center(
                                    child: InkWell(
                                      onTap: () {
                                        Get.toNamed(RouteName.splash);
                                      },
                                      child: Text(
                                        'Kisah Leak Bali 1',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: MediaQuery.of(context).size.width * 0.02,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  const Center(
                                    child: Text(
                                      'Penulis Penulis',
                                      style: TextStyle(
                                        color: greyText,
                                      ),
                                    ),
                                  ),
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
      ),
    );
  }
}
