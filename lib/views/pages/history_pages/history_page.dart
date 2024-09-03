import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/views/widgets/background_screen.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
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
        title: const Text(
          'Riwayat Kuis dan Tes Bercerita',
          style: TextStyle(
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
                itemCount: 10,
                itemBuilder: (context, index) {
                  index++;
                  return Column(
                    children: [
                      ListTile(
                        leading: const AspectRatio(
                          aspectRatio: 1,
                          child: Image(
                            image: AssetImage('assets/images/cover_detail.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        title: Text(
                          'Asal Mula Selat Bali $index',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.width * 0.35,
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
                                      const ImageIcon(
                                        AssetImage('assets/icons/pencil.png'),
                                        color: lightBlue,
                                      ),
                                      Text(
                                        '100',
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
                                    children: [
                                      const ImageIcon(
                                        AssetImage('assets/icons/book.png'),
                                        color: lightBlue,
                                      ),
                                      Text(
                                        '100',
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
                                    RouteName.detailHistory,
                                    arguments: 'Asal Mula Selat Bali $index',
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
                                    'Detail',
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
