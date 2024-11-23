import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/services/scoring_service.dart';

class ScoringController extends GetxController {
  late TextEditingController scoreController;
  late TextEditingController noteController;
  final ss = ScoringService();

  @override
  void onInit() {
    super.onInit();
    var arg = Get.arguments;
    scoreController = TextEditingController(text: arg['readTestScore'].toString());
    noteController = TextEditingController(text: arg['readTestMessage'].toString());
  }
}
