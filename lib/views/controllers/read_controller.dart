import 'package:get/get.dart';
import 'package:tarali/services/user_service.dart';

class ReadController extends GetxController {
  var index = 1.obs;
  UserService us = UserService();

  void next(){
    index++;
  }

  void prev(){
    index--;
  }
}