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

  // Mulai polling untuk memeriksa status verifikasi email
  void startEmailVerificationPolling(){
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) async {
      await authService.authRef.currentUser?.reload();// Refresh status pengguna
      final user = authService.authRef.currentUser;

      if (user != null && user.emailVerified) {
        // Jika terverifikasi, hentikan polling dan pindah ke Dashboard
        await authService.checkEmailVerification();
        _timer?.cancel();
        Get.offAll(() => const DashboardPage());
      }
    });
  }

  // Hentikan polling jika tidak diperlukan lagi
  Future<void> stopEmailVerificationPolling() async {
    _timer?.cancel();
    bool data = await authService.checkEmailVerification();
    if(!data){
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