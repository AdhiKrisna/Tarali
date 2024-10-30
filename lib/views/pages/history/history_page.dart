import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/constants/constant_text_style.dart';
import 'package:tarali/models/scoring_model.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/views/controllers/history_controller.dart';
import 'package:tarali/views/widgets/background_screen.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final argument = Get.arguments;
    final HistoryController historyController = Get.put(HistoryController());

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
          'Riwayat Kuis dan Tes Bercerita',
          style: PoppinsStyle.stylePoppins(
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
                vertical: MediaQuery.of(context).size.height * 0.0125,
              ),
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder(
                stream: historyController.ss.getAllHistory(argument['uId']),
                builder: (context, snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  List<ScoringModel> model = historyController.ss.getAllHistoryData(data: snapshot.data!.docs);
                  if(model.isNotEmpty){
                    return ListView.builder(
                      itemCount: model.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              leading: AspectRatio(
                                aspectRatio: 1,
                                child: Image(
                                  image: NetworkImage(model[index].cover),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              title: Text(
                                model[index].title,
                                style: PoppinsStyle.stylePoppins(
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
                                              '${model[index].quizScore == 0 ? '-' : model[index].quizScore}',
                                              style: PoppinsStyle.stylePoppins(
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
                                              '${model[index].readTestScore == 0 ? '-' : model[index].readTestScore}',
                                              style: PoppinsStyle.stylePoppins(
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
                                          arguments: model[index].toMap(),
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
                                          style: PoppinsStyle.stylePoppins(
                                            color: white,
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.02,
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
                    );
                  }else{
                    return const Center(
                      child: Text(
                        'Anda belum memiliki history.',
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
