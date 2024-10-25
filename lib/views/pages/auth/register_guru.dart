import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/services/auth_service.dart';
import 'package:tarali/views/controllers/auth_controllers/register_guru_controller.dart';
import 'package:tarali/views/widgets/auth_textfield.dart';

class RegisterGuru extends StatelessWidget {
  RegisterGuru({super.key});
  final RegisterGuruController formRegisterController =
      Get.put(RegisterGuruController());
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (v){
        Future.microtask(() => Get.offNamedUntil(RouteName.loginGuru, ModalRoute.withName(RouteName.loginGuru)));
      },
      canPop: false,
      child: Scaffold(
          body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.06,
                    ),
                    child: const Image(
                      image: AssetImage('assets/images/auth_guru_image.png'),
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: SafeArea(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                  left: MediaQuery.of(context).size.width * 0.025,
                  right: MediaQuery.of(context).size.width * 0.05,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Registrasi sebagai Guru',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Isi data diri terlebih dahulu',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: AuthTextField(
                              label: 'Email',
                              hint: 'Masukkan email (@belajar.id)',
                              controller: formRegisterController.emailController,
                              isDense: true,
                              pFontSize: 0.0175,
                            ),
                          ),
                          SizedBox(
                            child: AuthTextField(
                              label: 'Nama',
                              hint: 'Masukkan nama anda',
                              controller: formRegisterController.nameController,
                              isDense: true,
                              pFontSize: 0.0175,
                            ),
                          ),
                          SizedBox(
                            child: AuthTextField(
                              label: 'Nama Sekolah',
                              hint: 'Masukkan sekolah tempat anda mengajar',
                              controller: formRegisterController.nameController,
                              isDense: true,
                              pFontSize: 0.0175,
                            ),
                          ),
                          Text(
                            'Pastikan nama sekolah benar dan sesuai dengan yang didaftarkan oleh murid anda nanti ya!',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: MediaQuery.of(context).size.width * 0.015,
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            child: AuthTextField(
                              label: 'Password',
                              hint: 'Masukkan password anda',
                              isPassword: true,
                              controller:
                                  formRegisterController.passwordController,
                              isDense: true,
                              pFontSize: 0.0175,
                            ),
                          ),
                          SizedBox(
                            child: AuthTextField(
                              label: 'Konfirmasi Password',
                              hint: 'Masukkan konfirmasi password',
                              isPassword: true,
                              controller: formRegisterController
                                  .confirmPasswordController,
                              isDense: true,
                              pFontSize: 0.0175,
                            ),
                          ),
                        ],
                      ),
                      RichText(
                          text: TextSpan(
                        text: 'Sudah punya akun guru? ',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        children: [
                          TextSpan(
                            text: 'Masuk',
                            style: const TextStyle(
                              color: lightBlue,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed((RouteName.loginGuru));
                              },
                          ),
                        ],
                      )),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: MediaQuery.of(context).size.width ,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: lightBlue,
                          ),
                          onPressed: () {
                            if(!formRegisterController.emailController.value.text.contains('@belajar.id')){
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                  Text('Email tidak terdeteksi sebagai guru.'),
                                ),
                              );
                            }else if(formRegisterController.passwordController.value.text.isEmpty){
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                  Text('Password tidak boleh kosong.'),
                                ),
                              );
                            }else if(formRegisterController.passwordController.value.text.length <= 8){
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                  Text('Password harus lebih dari 8 karakter.'),
                                ),
                              );
                            }else if(formRegisterController.passwordController.value.text != formRegisterController.confirmPasswordController.value.text){
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                  Text('Konfirmasi password tidak sesuai.'),
                                ),
                              );
                            }else{
                              authService.register(
                                email: formRegisterController.emailController.value.text,
                                pass: formRegisterController.passwordController.value.text,
                              ).then((value){
                                Get.offAllNamed(RouteName.dashboard);
                              });
                            }
                          }, // methdod daftar nnti
                          child: Text(
                            'Registrasi',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.02,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          )),
        ],
      )),
    );
  }
}
