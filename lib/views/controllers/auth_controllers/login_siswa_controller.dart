import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/services/auth_service.dart';

class LoginSiswaController extends GetxController {
  final nameController = TextEditingController();
  final absenController = TextEditingController();
  final sekolahController = TextEditingController();
  final AuthService as = AuthService();
  // final formKey = GlobalKey<FormState>();

  @override
  void onClose() {
    nameController.dispose();
    absenController.dispose();
    sekolahController.dispose();
    super.onClose();
  }
}
