import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/services/user_service.dart';

class LoginSiswaController extends GetxController {
  final nameController = TextEditingController();
  final absenController = TextEditingController();
  final sekolahController = TextEditingController();
  final UserService as = UserService();

  @override
  void onClose() {
    nameController.dispose();
    absenController.dispose();
    sekolahController.dispose();
    super.onClose();
  }
}
