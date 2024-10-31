import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/services/scoring_service.dart';

class ScoringController extends GetxController {
  final scoreController = TextEditingController();
  final noteController = TextEditingController();
  final ss = ScoringService();

  final sortBy = "".obs;

  void setSortBy({required String sortBy}){
    this.sortBy.value = sortBy;
  }
}
