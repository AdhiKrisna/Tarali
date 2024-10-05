import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/views/widgets/background_widget.dart';

class ReadingTestPage extends StatelessWidget {
  const ReadingTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget.setWhiteBackground(
      context: context,
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              const Text(
                'Asal Mula Selat Bali',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Stack(
              children: [
                ListView(
                  children: const [
                    Text("""Dahulu kala, di pulau Jawa, ada sebuah kerajaan besar yang dipimpin oleh seorang raja bijaksana bernama Prabu Menak Dadali. Prabu Menak Dadali memiliki seorang putra bernama Manik Angkeran. Manik Angkeran adalah anak yang cerdas, tetapi sayangnya, ia suka berjudi dan sering membuat masalah.

Suatu hari, Manik Angkeran terlilit hutang karena kalah berjudi. Ia sangat ketakutan dan bingung bagaimana caranya melunasi hutangnya. Lalu, ia teringat cerita tentang Naga Besukih, seekor naga sakti yang tinggal di Gunung Agung, Bali. Naga ini memiliki kekayaan yang luar biasa.

Manik Angkeran pun pergi ke Bali untuk menemui Naga Besukih. Sesampainya di sana, ia melakukan ritual dan berdoa agar Naga Besukih muncul. Naga Besukih pun muncul dari dalam gua. Manik Angkeran meminta bantuan kepada Naga Besukih untuk melunasi hutangnya. Karena Manik Angkeran berbicara dengan sangat sopan, Naga Besukih bersedia membantunya dengan memberi banyak emas dan permata.

Namun, setelah mendapatkan harta itu, Manik Angkeran malah tamak. Ia ingin memiliki lebih banyak lagi. Saat Naga Besukih berbalik untuk kembali ke guanya, Manik Angkeran diam-diam memotong ekor naga itu untuk mengambil sisa harta yang ada di ujung ekor tersebut.

Naga Besukih sangat marah karena dikhianati. Dengan kemarahannya, naga itu mengutuk Manik Angkeran sehingga ia terbakar menjadi abu. Ketika Prabu Menak Dadali mengetahui bahwa anaknya telah meninggal karena keserakahannya, ia sangat sedih.

Prabu Menak Dadali pun pergi ke Gunung Agung untuk meminta maaf kepada Naga Besukih. Ia meminta agar anaknya dihidupkan kembali. Naga Besukih setuju dengan syarat bahwa Manik Angkeran harus hidup dengan bijaksana dan tidak serakah lagi. Prabu Menak Dadali pun setuju, dan Manik Angkeran dihidupkan kembali.

Namun, karena perbuatan Manik Angkeran yang jahat, Naga Besukih memisahkan Pulau Bali dan Pulau Jawa dengan menggesekkan ekornya di tanah, sehingga terbentuklah laut di antara kedua pulau tersebut. Laut inilah yang sekarang kita kenal sebagai Selat Bali.

Sejak saat itu, Manik Angkeran belajar untuk menjadi orang yang lebih baik, dan Selat Bali menjadi pengingat bagi semua orang agar tidak tamak dan selalu hidup dengan bijaksana.""",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14,
                        color: blackText,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: lightBlue,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(10),
                        ),
                        onPressed: (){},
                        child: const Icon(
                          Icons.file_upload,
                          size: 30,
                          color: white,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: lightBlue,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(10),
                        ),
                        onPressed: (){},
                        child: const Icon(
                          Icons.mic,
                          size: 30,
                          color: white,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
