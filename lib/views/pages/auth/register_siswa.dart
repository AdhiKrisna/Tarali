import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/views/controllers/auth_controllers/register_siswa_controller.dart';
import 'package:tarali/views/widgets/auth_textfield.dart';

class RegisterSiswa extends StatelessWidget {
  RegisterSiswa({super.key});
  final RegisterSiswaController formRegisterController = Get.put(RegisterSiswaController());

  @override
  Widget build(BuildContext context) {
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
                  width: MediaQuery.of(context).size.width * 0.4,
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
                  top: MediaQuery.of(context).size.height * 0.05,
                  left: MediaQuery.of(context).size.width * 0.025,
                  right: MediaQuery.of(context).size.width * 0.05,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Registrasi',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: AuthTextField(
                                  label: 'Nama',
                                  hint: 'Masukkan nama kamu disini',
                                  controller:
                                      formRegisterController.nameController,
                                  isDense: true,
                                  pFontSize: 0.0165,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: AuthTextField(
                                  label: 'Kelas',
                                  hint: 'Masukkan kelas kamu disini',
                                  controller:
                                      formRegisterController.kelasController,
                                  isDense: true,
                                  pFontSize: 0.0165,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: AuthTextField(
                                  label: 'Nomor Absen',
                                  hint: 'Masukkan absen kamu disini',
                                  controller:
                                      formRegisterController.absenController,
                                  isNumber: true,
                                  isDense: true,
                                  pFontSize: 0.0165,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: AuthTextField(
                                  label: 'Nama Sekolah',
                                  hint: 'Nama sekolah kamu disini',
                                  controller:
                                      formRegisterController.sekolahController,
                                  isDense: true,
                                  pFontSize: 0.0175,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: lightBlue,
                              ),
                              onPressed: () {}, // methdod daftar nnti
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
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: ElevatedButton(
                              onPressed: () =>
                                  Get.toNamed(RouteName.loginSiswa),
                              style: ElevatedButton.styleFrom(
                                side: const BorderSide(color: lightBlue),
                                padding: const EdgeInsets.all(0),
                              ),
                              child: Text(
                                'Masuk',
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
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => Get.toNamed(RouteName.registerGuru),
                          style: ElevatedButton.styleFrom(
                            side: const BorderSide(color: lightBlue),
                            padding: const EdgeInsets.all(0),
                          ),
                          child: Text(
                            'Registrasi sebagai guru',
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
          )),
        ],
      ),
    );
  }
}
