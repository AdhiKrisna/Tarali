import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/services/auth_service.dart';

class RegisterSiswaController extends GetxController {
  final nameController = TextEditingController();
  final absenController = TextEditingController();
  final kelasController = TextEditingController();
  final sekolahController = TextEditingController();
  final AuthService as = AuthService();

  @override
  void onClose() {
    nameController.dispose();
    absenController.dispose();
    kelasController.dispose();
    sekolahController.dispose();
    super.onClose();
  }
}
