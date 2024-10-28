import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/views/controllers/auth_controllers/login_siswa_controller.dart';
import 'package:tarali/views/widgets/auth_textfield.dart';

class LoginSiswa extends StatelessWidget {
  LoginSiswa({super.key});
  final LoginSiswaController formLoginController =
      Get.put(LoginSiswaController());
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (v)async{
        Future.microtask(() => Get.offAllNamed(RouteName.dashboard));
      },
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
                          AuthTextField(
                            label: 'Nama',
                            hint: 'Masukkan nama kamu',
                            controller: formLoginController.nameController,
                            pFontSize: 0.0175,
                          ),
                          AuthTextField(
                            label: 'Nomor Absen',
                            hint: 'Masukkan nomor absen kamu',
                            controller: formLoginController.absenController,
                            isNumber: true,
                            pFontSize: 0.0175,
                          ),
                          AuthTextField(
                            label: 'Nama Sekolah',
                            hint: 'Masukkan nama sekolah kamu',
                            controller: formLoginController.sekolahController,
                            pFontSize: 0.0175,
                          ),
                          Text(
                            'Pastikan nama sekolah benar dan sesuai dengan arahan gurumu ya!',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: MediaQuery.of(context).size.width * 0.0175,
                            ),
                          ),
                        const SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.225,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: lightBlue,
                                  ),
                                  onPressed: () {
                                    String nama = formLoginController.nameController.text;
                                    String absen = formLoginController.absenController.text;
                                    String sekolah = formLoginController.sekolahController.text;
                                    if(nama.isEmpty || absen.isEmpty || sekolah.isEmpty){
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content:
                                          Text('Lengkapi data terlebih dahulu.'),
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
                                      formLoginController.as.loginStudent(
                                        nama: nama,
                                        absen: absen,
                                        sekolah: sekolah
                                      ).then((value){
                                        Navigator.of(context).pop();
                                        if(value){
                                          Get.offAllNamed(RouteName.dashboard);
                                        }else{
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                              content:
                                              Text('Data tidak sesuai atau salah. Jika merasa belum memiliki akun, registrasi terlebih dahulu.'),
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
                                    'Registrasi',
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
                              onPressed: () => Get.offNamedUntil(RouteName.loginGuru, ModalRoute.withName(RouteName.loginSiswa)),
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
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
