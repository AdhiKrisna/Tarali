import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tarali/constants/constant_colors.dart';
import 'package:tarali/routes/route_name.dart';
import 'package:tarali/services/scoring_service.dart';

class ReadTestController extends GetxController {
  final AudioRecorder recorder = AudioRecorder();
  final ss = ScoringService();
  var isRecording = false.obs, isPaused = false.obs;
  RxString? recordingPath;
  late Timer timer;
  var counterSecond = 0.obs;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      counterSecond++;
      print(counterSecond);
    });
  }

  Future<void> startVoiceStream() async {
    try {
      if (await recorder.hasPermission()) {
        print("Permission granted");
        isRecording.value = true;
        final Directory appDocDir = await getApplicationDocumentsDirectory();
        final String filePath = path.join(appDocDir.path,
            "audio_${DateTime.now().millisecondsSinceEpoch}.wav");
        await recorder.start(const RecordConfig(), path: filePath);
        recordingPath = ''.obs;
        print("Voice stream started");
        print("Filepath : $filePath");
        startTimer();
      }
      update();
    } catch (e) {
      print("Error starting voice stream: $e");
    }
  }

  Future<void> stopVoiceStream() async {
    timer.cancel();
    try {
      String? filePath = await recorder.stop();
      if (filePath != null) {
        isRecording.value = false;
        recordingPath = filePath.obs;
        print("Voice stream stopped");
        timer.cancel();
        counterSecond.value = 0;
        print("Recording path : $recordingPath");
      }
    } catch (e) {
      print("Error stopping voice stream: $e");
    }
  }

  //ini nanti disini method untuk up ke storage dan firestore, KALAU button sudah selesainya diklik
  Future<void> uploadVoiceStream(dynamic arguments) async {
    final recordingPath = this.recordingPath;
    if (recordingPath != null) {
      ss.uploadTestReadAssignment(
        path: recordingPath.value,
        argument: arguments,
      )
          .then((value) {
        if (value) {
           arguments['isFinishedReadTest'] = true;
              Get.offNamed(
                RouteName.testResultPage,
                arguments: arguments,
              );
        } else {
          Get.snackbar(
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.red,
            'Gagal',
            'File gagal diupload. Cek jaringan anda lalu coba lagi.',
          );
        }
      });
    }
  }

  Future<void> pauseVoiceStream() async {
    timer.cancel();
    try {
      if (isRecording.value) {
        await recorder.pause();
        isPaused.value = true;
        timer.cancel();
        print("Voice stream paused");
      }
    } catch (e) {
      print("Error pausing voice stream: $e");
    }
  }

  Future<void> resumeVoiceStream() async {
    try {
      if (isPaused.value) {
        await recorder.resume();
        isPaused.value = false;
        startTimer();
        print("Voice stream resumed");
      }
    } catch (e) {
      print("Error resuming voice stream: $e");
    }
  }

  Future<void> pickAudioFile(dynamic arguments) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.audio,
      );

      if (result != null && result.files.single.path != null) {
        String filePath = result.files.single.path!;
        print("Picked file path: $filePath");
        Get.defaultDialog(
          title: "Konfirmasi Pengumpulan",
          middleText:
              'Apakah kamu yakin ingin mengumpulkan rekaman suaramu ini sebagai aktivitas "Mari Bercerita"?',
          textCancel: "Belum",
          textConfirm: "Ya",
          barrierDismissible: false,
          confirmTextColor: Colors.white,
          cancelTextColor: blackText,
          buttonColor: lightBlue,
          onCancel: () {},
          onConfirm: () async {
            ss.uploadTestReadAssignment(
              path: filePath,
              argument: arguments,
            ).then((value){
              Get.back();
              if(value){
                Get.back();
                arguments['isFinishedReadTest'] = true;
                Get.offNamed(
                  RouteName.testResultPage,
                  arguments: arguments,
                );
                Get.reload();
                Get.snackbar(
                  duration: const Duration(seconds: 5),
                  backgroundColor: Colors.green,
                  snackPosition: SnackPosition.BOTTOM,
                  'Kegiatan "Mari Bercerita" Sudah Selesai',
                  'Tunggu hingga gurumu memberimu nilai ya!',
                );
              }else{
                Get.snackbar(
                  duration: const Duration(seconds: 2),
                  backgroundColor: Colors.red,
                  'Gagal',
                  'File gagal diupload. Cek jaringan anda lalu coba lagi.',
                );
              }
            });
          },
        );
      } else {
        print("No file selected");
      }
    } catch (e) {
      print("Error picking file: $e");
    }
  }

  @override
  void onClose() {
    if (isRecording.isTrue) {
      stopVoiceStream();
      timer.cancel();
    }
    super.onClose();
  }
}
