import 'package:get/get.dart';

class ReadController extends GetxController {
  var index = 1.obs;
  var isAnyImage = true.obs;

  void next(){
    index++;
  }

  void prev(){
    index--;
  }

  void showImage(){
    isAnyImage = true.obs;
  }

  void hideImage(){
    isAnyImage = false.obs;
  }
}