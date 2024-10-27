import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/views/pages/dashboard_page.dart';

import '../../../routes/route_name.dart';
import '../../../services/auth_service.dart';

class RegisterGuruController extends GetxController{
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final sekolahController = TextEditingController();
  final AuthService authService = AuthService();

  Timer? _timer;

  void startEmailVerificationPolling(){
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) async {
      await authService.authRef.currentUser?.reload();
      final user = authService.authRef.currentUser;

      if (user != null && user.emailVerified) {
        await authService.checkEmailVerification();
        _timer?.cancel();
        Get.offAll(() => const DashboardPage());
      }
    });
  }

  Future<void> stopEmailVerificationPolling() async {
    _timer?.cancel();
    var data = authService.authRef.currentUser;
    if(data == null || !data.emailVerified){
      authService.deleteTemporaryUsers();
      authService.logout();
      Future.microtask(() => Get.offNamedUntil(RouteName.loginGuru, ModalRoute.withName(RouteName.loginGuru)));
    }
  }

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