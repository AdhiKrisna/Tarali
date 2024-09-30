import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/views/widgets/textfield_login.dart';

class LoginSiswa extends StatelessWidget {
  const LoginSiswa({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController absenController = TextEditingController();
    final TextEditingController sekolahController = TextEditingController();
    return Scaffold(
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
                      image: AssetImage('assets/images/auth_image.png'),
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
                    left: MediaQuery.of(context).size.width * 0.025,
                    right: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Masuk',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Isi data diri kamu dulu yuk!',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFieldLogin(
                          label: 'Nama',
                          hint: 'Masukkan nama kamu',
                          controller: nameController,
                          pFontSize: 0.0175,
                        ),
                        TextFieldLogin(
                          label: 'Nomor Absen',
                          hint: 'Masukkan nomor absen kamu',
                          controller: absenController,
                          isNumber: true,
                          pFontSize: 0.0175,
                        ),
                        TextFieldLogin(
                          label: 'Nama Sekolah',
                          hint: 'Masukkan nama sekolah kamu',
                          controller: sekolahController,
                          pFontSize: 0.0175,
                          helper:
                              'Pastikan nama sekolah benar dan sesuai dengan\narahan gurumu ya!',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.225,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: lightBlue,
                                ),
                                onPressed: () {}, // methdod cek login nnti
                                child: Text(
                                  'Masuk',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: white,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.02,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.225,
                              child: ElevatedButton(
                                onPressed: () =>
                                    Get.toNamed(RouteName.registerSiswa),
                                style: ElevatedButton.styleFrom(
                                  side: const BorderSide(color: lightBlue),
                                  padding: const EdgeInsets.all(0),
                                ),
                                child: Text(
                                  'Daftar',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: lightBlue,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.02,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => Get.toNamed(RouteName.loginGuru),
                            style: ElevatedButton.styleFrom(
                              side: const BorderSide(color: lightBlue),
                              padding: const EdgeInsets.all(0),
                            ),
                            child: Text(
                              'Masuk sebagai guru',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: lightBlue,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.02,
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
          ),
        ],
      ),
    );
  }
}
