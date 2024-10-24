import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:tarali/services/content_service.dart';

class DashboardController extends GetxController {
  var isSearching = false.obs, isListening = false.obs;
  var searchController = TextEditingController();
  var cs = ContentService();
  // final storageRef = FirebaseStorage.instance.ref();
  final SpeechToText speechToText = SpeechToText();
  bool speechEnabled = false;
  String wordSpoken = '';
  double confidenceLevel = 0.0;

  @override
  void onInit() {
    initSpeech();
    super.onInit();
  }

  @override
  void onClose() {
    searchController.dispose();
    searchController.clear();
    super.onClose();
  }

  void toggleSearch() {
    isSearching.value = !isSearching.value;
  }

  void searchContent() {
    try {
      if (searchController.text.isNotEmpty) {
        print(searchController.text + ' from controller');
        cs.getSearchContent(searchController.text).listen((event) {
          print(event);
        });
      } else {
        print('Search is empty');
      }
    } catch (e) {
      print('Error in searchContent: $e');
    }
  }

  void initSpeech() async {
    try {
      speechEnabled = await speechToText.initialize();
      print(speechEnabled);
    } catch (e) {
      print('Error in initSpeech: $e');
    }
  }

  void startListening() async {
    try {
      isListening.value = true;
      await speechToText.listen(onResult: (onSpeechResult));
    } catch (e) {
      print('Error in startListening: $e');
      isListening.value = false;
    }
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    try {
      if (result.finalResult) {
        confidenceLevel = result.confidence;
        print(confidenceLevel);
        searchController.text = result.recognizedWords;
        print(searchController.text + ' from speech to text');
        searchContent(); //ini pr 
      }
    } catch (e) {
      print('Error in onSpeechResult: $e');
    }
  }

  void stopListening() async {
    try {
      isListening.value = false;
      await speechToText.stop();
    } catch (e) {
      print('Error in stopListening: $e');
    }
  }
}
