import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/services/scoring_service.dart';

class QuizController extends GetxController {
  var index = 0.obs;
  var totalIndex = 0;
  var choice = <int>[].obs;
  var answers = <int>[].obs;
  var imageUrl = ''.obs;
  var counterSecond = 0;
  late Timer timer;
  ScoringService ss = ScoringService();

  @override
  void onInit() {
    super.onInit();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      counterSecond++;
    });
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }

  void setData({required int lengthData}) {
    totalIndex = lengthData;
    for (int i = 0; i < totalIndex; i++) {
      choice.add(-1.obs);
    }
  }

  void setImageUrl({required String url}) {
    imageUrl.value = url;
  }

  void nextPage() {
    if (index.value < totalIndex - 1) {
      index.value++;
    }
  }

  void prevPage() {
    if (index.value > 0) {
      index.value--;
    }
  }

  String detailPage() {
    return '${index.value + 1} dari $totalIndex';
  }

  void setChoice(int choice) {
    this.choice[index.value] = choice;
  }

  void setAnswer() {
    answers.clear();
    for (int i = 0; i < totalIndex; i++) {
      answers.add(choice[i]);
    }
  }

  Future<void> scoring(kunciJawaban, argument) async {
    setAnswer();
    int benar = 0;
    for (int i = 0; i < totalIndex; i++) {
      if (answers[i] == kunciJawaban[i].jawaban) {
        benar += 1;
      }
    }

    double score = (benar / totalIndex * 100);
    argument['benar'] = benar;
    argument['quizScore'] = score;
    argument['quizJawaban'] = answers.toList(); //KEMUNGKINAN TIDA PERLU
    argument['totalSoal'] = totalIndex;
    argument['counterSecond'] = counterSecond;

    await ss.setQuizTestAssignment(argument: argument).then((value) {
      if (value) {
        Get.offNamed(RouteName.quizResultPage, arguments: argument);
        Get.snackbar(
          backgroundColor: Colors.green,
          colorText: Colors.white,
          'Sukses',
          'Selamat, anda berhasil mengerjakan kuis.',
        );
      } else {
        Get.snackbar(
          backgroundColor: Colors.red,
          colorText: Colors.white,
          'Gagal',
          'Kuis gagal diproses, periksa kembali jaringan anda.',
        );
      }
    });
  }

  
}
