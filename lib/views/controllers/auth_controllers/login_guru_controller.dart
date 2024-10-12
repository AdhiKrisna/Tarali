
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginGuruController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}