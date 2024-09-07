import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/views/widgets/background_widget.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgorundWidget.setMainBackground(
      context: context,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: white,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'Asal Mula Selat Bali',
                  style: TextStyle(
                    fontSize: 22,
                    color: white,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w800,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ]
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/cover_detail.png',
                        fit: BoxFit.cover,
                      ),
                    )
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        ElevatedButton(onPressed: (){}, child: Text('abc')),
                        ElevatedButton(onPressed: (){}, child: Text('abc')),
                        ElevatedButton(onPressed: (){}, child: Text('abc')),
                        ElevatedButton(onPressed: (){}, child: Text('abc')),
                        ElevatedButton(onPressed: (){}, child: Text('abc')),
                        ElevatedButton(onPressed: (){}, child: Text('abc')),
                        ElevatedButton(onPressed: (){}, child: Text('abc')),
                      ],
                    ),
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
