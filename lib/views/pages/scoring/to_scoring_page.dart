import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/constants/constant_text_style.dart';
import 'package:tarali/models/content_model.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/views/controllers/dashboard_controller.dart';
import 'package:tarali/views/widgets/background_widget.dart';

class ToScoringPage extends StatelessWidget {
  ToScoringPage({super.key});
  final DashboardController dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    final argument = Get.arguments;
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
          'Nilai Tes Bercerita Siswa',
          style: PoppinsStyle.stylePoppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BackgroundWidget.setMeruBg(
        context: context,
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.01,
              vertical: MediaQuery.of(context).size.height * 0.0125,
            ),
            width: MediaQuery.of(context).size.width,
            child: StreamBuilder(
                stream: DashboardController().cs.getAllContent(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  List<ContentModel> data = dashboardController.cs.getAllContentData(data: snapshot.data!.docs);
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final content = data[index];
                      return Column(
                        children: [
                          ListTile(
                            leading: AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(
                                content.coverDashboard,
                                fit: BoxFit.fill,
                              ),
                            ),
                            title: Text(
                              content.title,
                              style: PoppinsStyle.stylePoppins(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.025,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.12,
                              width: MediaQuery.of(context).size.width * 0.25,
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
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01),
                                      child: Row(
                                        children: [
                                          const ImageIcon(
                                            AssetImage('assets/icons/person.png'),
                                            color: lightBlue,
                                          ),
                                          StreamBuilder(
                                            stream: dashboardController.ss.getAllReadTestAssignment(
                                              contentId: content.contentId,
                                              sekolah: argument['sekolah'],
                                            ),
                                            builder: (content, snapshot){
                                              if (snapshot.connectionState == ConnectionState.waiting) {
                                                return Text(
                                                  '...',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                        0.0225,
                                                  ),
                                                );
                                              }
                                              return Text(
                                                snapshot.data?.docs.length.toString() ?? '0',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      0.0225,
                                                ),
                                              );
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.01,
                                  ),
                                  SizedBox(
                                    height: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        var args = Map.from(content.toMap())..addAll(argument);
                                        args['contentId'] = content.contentId;
                                        args['title'] = content.title;
                                        Get.toNamed(
                                          RouteName.detailToScoringPage,
                                          arguments: args,
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.02),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        disabledBackgroundColor: lightBlue,
                                        backgroundColor: lightBlue,
                                      ),
                                      child: Text(
                                        'Detail',
                                        style: PoppinsStyle.stylePoppins(
                                          color: white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
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
                                    MediaQuery.of(context).size.width *
                                        0.025),
                            child: const Divider(
                              thickness: 1,
                              color: bgBlue,
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }),
          ),
        ),
      ),
    );
  }
}
