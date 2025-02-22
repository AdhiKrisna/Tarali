import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_text_style.dart';
import 'package:tarali/views/controllers/auth_controllers/register_guru_controller.dart';

class VerifyGuruPage extends StatefulWidget {
  const VerifyGuruPage({super.key});

  @override
  State<VerifyGuruPage> createState() => _VerifyGuruPageState();
}

class _VerifyGuruPageState extends State<VerifyGuruPage> {
  final RegisterGuruController _authController = Get.find<RegisterGuruController>();

  @override
  void initState() {
    super.initState();
    _authController.startEmailVerificationPolling();
  }

  @override
  void dispose()async{
    _authController.stopEmailVerificationPolling();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 20),
            Text(
              'Memeriksa verifikasi email...\nJangan tinggalkan halaman ini dan silakan buka email Anda.',
              textAlign: TextAlign.center,
              style: PoppinsStyle.stylePoppins(),
            ),
          ],
        ),
      ),
    );
  }
}
