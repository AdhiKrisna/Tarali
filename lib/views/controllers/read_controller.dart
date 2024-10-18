import 'package:get/get.dart';

class ReadController extends GetxController {
  var index = 1.obs;

  void next(){
    index++;
  }

  void prev(){
    index--;
  }
}