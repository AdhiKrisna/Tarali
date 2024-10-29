import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/services/scoring_service.dart';

class ScoringController extends GetxController {
  final scoreController = TextEditingController();
  final noteController = TextEditingController();
  final ss = ScoringService();

  void saveScore(int score, String feedback, String title, String name) {
    print('Name: $name');
    print('Score: $score');
    print('Feedback: $feedback');
    print('Title: $title');
    Get.offNamed(
      RouteName.detailToScoringPage,
      arguments: [title, name],
    );
  }
}
