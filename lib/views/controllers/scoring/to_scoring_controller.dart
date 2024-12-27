import 'package:get/get.dart';


class ToScoringController extends GetxController {
  final sortBy = "".obs;

  void setSortBy({required String sortBy}){
    this.sortBy.value = sortBy;
  }
}