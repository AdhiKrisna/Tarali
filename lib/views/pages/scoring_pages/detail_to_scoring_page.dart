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
        title:  Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          const BackgroundScreenWidget(),
          SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.01,
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
                                fontSize: MediaQuery.of(context).size.width * 0.02,
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
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                       Icon(
                                        Icons.star,
                                        color: lightBlue,
                                        size: MediaQuery.of(context).size.width * 0.025,

                                      ),
                                      Text(
                                        index == 1  ? '100' : index == 3 ? '80' : '-',
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
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                       Icon(
                                        Icons.access_time_filled,
                                        color: lightBlue,
                                        size: MediaQuery.of(context).size.width * 0.025,
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.01,
                                      ),
                                      Text(
                                        index == 2  ? '7:17' : index == 4 ? '5:14' : '3:30',
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
                                    padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width * 0.02),
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