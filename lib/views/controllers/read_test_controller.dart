import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';

class ReadTestController extends GetxController {
  final AudioRecorder recorder = AudioRecorder();
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

  Future<void> pickAudioFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.audio,
      );

      if (result != null && result.files.single.path != null) {
        String filePath = result.files.single.path!;
        print("Picked file path: $filePath");
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
