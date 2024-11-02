import 'package:get/get.dart';

import '../../../services/scoring_service.dart';

class ToScoringController extends GetxController {
  final ss = ScoringService();
  final sortBy = "".obs;

  void setSortBy({required String sortBy}){
    this.sortBy.value = sortBy;
  }
}