import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/constants/constant_text_style.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/views/controllers/auth_controllers/login_guru_controller.dart';
import 'package:tarali/views/widgets/auth_textfield.dart';

class LoginGuru extends StatelessWidget {
  LoginGuru({super.key});
  final LoginGuruController formLoginController =
      Get.put(LoginGuruController());

  @override
  Widget build(BuildContext context) {
    // Get.put(LocalController());
    return PopScope(
      onPopInvoked: (v)async {
        Future.microtask(() => Get.offNamedUntil(RouteName.loginSiswa, ModalRoute.withName(RouteName.loginSiswa)));
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
                    width: MediaQuery.of(context).size.width * 0.45,
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
                  width: MediaQuery.of(context).size.width * 0.6,
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
                           Text(
                            'Masuk sebagai Guru',
                            style: PoppinsStyle.stylePoppins(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                           Text(
                            'Silahkan login untuk melanjutkan',
                            style: PoppinsStyle.stylePoppins(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AuthTextField(
                            label: 'Email',
                            hint: 'Masukkan email (@belajar.id)',
                            controller: formLoginController.emailController,
                            isDense: true,
                            pFontSize: 0.0175,
                          ),
                          AuthTextField(
                            label: 'Password',
                            hint: 'Masukkan password',
                            controller: formLoginController.passwordController,
                            isDense: true,
                            isPassword: true,
                            pFontSize: 0.0175,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              RichText(
                                  text: TextSpan(
                                text: 'Belum punya akun guru? ',
                                style: PoppinsStyle.stylePoppins(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Registrasi',
                                    style: PoppinsStyle.stylePoppins(
                                      color: lightBlue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.offNamedUntil(RouteName.registerGuru, ModalRoute.withName(RouteName.loginGuru));
                                      },
                                  ),
                                ],
                              )),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: lightBlue,
                              ),
                              onPressed: () async{
                                String email = formLoginController.emailController.text;
                                String pass = formLoginController.passwordController.text;
                                if(email.isEmpty || pass.isEmpty){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                      Text('Lengkapi data terlebih dahulu.'),
                                      backgroundColor: Colors.red,
                                      duration: Duration(seconds: 1),
                                    ),
                                  );
                                }else if(!email.isEmail){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                      Text('Format email tidak sesuai.'),
                                      backgroundColor: Colors.red,
                                      duration: Duration(seconds: 1),
                                    ),
                                  );
                                }else{
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    },
                                  );
                                  formLoginController.authService.loginTeacher(
                                    email: formLoginController.emailController.text,
                                    password: formLoginController.passwordController.text,
                                  ).then((value){
                                    Navigator.of(context).pop();
                                    if(value){
                                      Get.offAllNamed(RouteName.dashboard);
                                    }else{
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content:
                                          Text('Gagal Login!'),
                                          backgroundColor: Colors.red,
                                          duration: Duration(seconds: 1),
                                        ),
                                      );
                                    }
                                  });
                                }
                              }, // methdod cek login nnti
                              child: Text(
                                'Masuk',
                                style: PoppinsStyle.stylePoppins(
                                  color: white,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width *
                                          0.02,
                                ),
                              ),
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
