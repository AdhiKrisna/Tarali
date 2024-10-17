import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/views/controllers/player_controller.dart';

class SliderWidget extends StatelessWidget {
  final PlayerController controller = Get.put(PlayerController());
  SliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        width: MediaQuery.of(context).size.width < 760 ? MediaQuery.of(context).size.width * 0.4 : MediaQuery.of(context).size.width * 0.375,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.0275 + 5,
                  ),
                  Obx(
                    () => Text(
                      controller.currentSecondString, //ini durasi audio yang sedang diputar
                      style:  TextStyle(
                        color: lightBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                      ),
                    ),
                  ),
                ]),
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.05,
                ),
                Row(children: [
                   Text(
                    '5:36', //durasi audio
                    style: TextStyle(
                      color: grey,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.0275,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.025 + 5,
                  ),
                ]),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.05,
              child: Obx(() {
                return Slider(
                  value: controller.currentSecond.value.toDouble(),
                  max:  controller.duration.value.toDouble() + 1, //panjang maksimal slider nya == durasi, ku + 1 biar ga kena exception pas dah selesai
                  activeColor: lightBlue,
                  inactiveColor: grey,
                  onChanged: (value) {
                    controller.updateSliderValue(value);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
