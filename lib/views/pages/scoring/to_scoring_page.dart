import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/models/content_model.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/views/controllers/dashboard_controller.dart';
import 'package:tarali/views/widgets/background_screen.dart';

class ToScoringPage extends StatelessWidget {
  ToScoringPage({super.key});
  final DashboardController dashboardController =
      Get.put(DashboardController());

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
          'Nilai Tes Bercerita Siswa',
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
                                style: TextStyle(
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
                                              AssetImage(
                                                  'assets/icons/person.png'),
                                              color: lightBlue,
                                            ),
                                            Text(
                                              '100',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
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
                                      width: MediaQuery.of(context).size.width *
                                          0.01,
                                    ),
                                    SizedBox(
                                      height: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () => Get.toNamed(
                                          RouteName.detailToScoringPage,
                                          arguments: content.title,
                                        ),
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
                                          style: TextStyle(
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
        ],
      ),
    );
  }
}
