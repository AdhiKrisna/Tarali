import 'package:get/get.dart';
import 'package:tarali/services/scoring_service.dart';

class ReadController extends GetxController {
  var index = 1.obs;
  ScoringService ss = ScoringService();

  void next(){
    index++;
  }

  void prev(){
    index--;
  }
}