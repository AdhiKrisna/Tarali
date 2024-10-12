

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterGuruController extends GetxController{
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final sekolahController = TextEditingController();
  // final formKey = GlobalKey<FormState>();

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    sekolahController.dispose();
    super.onClose();
  }
}