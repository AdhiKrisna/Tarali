
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/user_service.dart';

class LoginGuruController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final UserService authService = UserService();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}