import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/constants/constant_text_style.dart';
import 'package:tarali/views/widgets/background_widget.dart';

class DetailHistoryPage extends StatelessWidget {
  const DetailHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var argument = Get.arguments;
    return Scaffold(
      body: BackgroundWidget.setMeruBg(
        context: context,
        child: SingleChildScrollView(
          child: IntrinsicHeight(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                ),
                child: SizedBox(
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.05,
                            ),
                            child: Container(
                              transformAlignment: Alignment.topCenter,
                              height: MediaQuery.of(context).size.height * 0.6,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image(
                                  image: NetworkImage(argument['cover']),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      SizedBox(
                        width: MediaQuery.of(context).size.width < 760
                            ? MediaQuery.of(context).size.width * 0.55
                            : MediaQuery.of(context).size.width * 0.6,
                        height: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.05,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      disabledBackgroundColor: Colors.white,
                                      backgroundColor: Colors.white,
                                      shape: const CircleBorder(),
                                    ),
                                    onPressed: () => Get.back(),
                                    child: Icon(
                                      size: MediaQuery.of(context).size.width <
                                              760
                                          ? MediaQuery.of(context).size.width *
                                              0.03
                                          : MediaQuery.of(context).size.width *
                                              0.025,
                                      Icons.arrow_back_ios_new_sharp,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.02),
                                  Text(
                                    argument['title'],
                                    style: PoppinsStyle.stylePoppins(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.025,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nilai',
                                      style: PoppinsStyle.stylePoppins(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.025,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      height: MediaQuery.of(context)
                                                  .size
                                                  .width <
                                              760
                                          ? MediaQuery.of(context).size.width *
                                              0.08
                                          : MediaQuery.of(context).size.width *
                                              0.1,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.16,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.01,
                                                vertical: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Row(
                                                    children: [
                                                      const ImageIcon(
                                                        AssetImage(
                                                            'assets/icons/pencil.png'),
                                                        color: Colors.blue,
                                                      ),
                                                      const SizedBox(
                                                        width: 6,
                                                      ),
                                                      Text(
                                                        '${argument['quizScore']}',
                                                        style: PoppinsStyle.stylePoppins(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.025,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    'Nilai Kuis',
                                                    style: PoppinsStyle.stylePoppins(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.015,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.02),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.16,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.01,
                                                vertical: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Row(
                                                    children: [
                                                      const ImageIcon(
                                                        AssetImage(
                                                            'assets/icons/book.png'),
                                                        color: Colors.blue,
                                                      ),
                                                      const SizedBox(
                                                        width: 6,
                                                      ),
                                                      Text(
                                                        '${argument['readTestScore']}',
                                                        style: PoppinsStyle.stylePoppins(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.025,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    'Nilai Bercerita',
                                                    style: PoppinsStyle.stylePoppins(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.015,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                    Text(
                                      'Catatan',
                                      style: PoppinsStyle.stylePoppins(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.025,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          color: bgBlue,
                                          width: 1,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Text(
                                          '${argument['readTestMessage']}',
                                          style: PoppinsStyle.stylePoppins(
                                            fontSize: 12,
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
