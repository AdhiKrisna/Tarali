import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginSiswaController extends GetxController {
  final nameController = TextEditingController();
  final absenController = TextEditingController();
  final sekolahController = TextEditingController();
  // final formKey = GlobalKey<FormState>();

  @override
  void onClose() {
    nameController.dispose();
    absenController.dispose();
    sekolahController.dispose();
    super.onClose();
  }
}
