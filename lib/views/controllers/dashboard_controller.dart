import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:tarali/models/user_model.dart';
import 'package:tarali/services/scoring_service.dart';
import 'package:tarali/services/user_service.dart';
import 'package:tarali/services/content_service.dart';

class DashboardController extends GetxController {
  var isSearching = false.obs, isListening = false.obs;
  var searchController = TextEditingController();
  var cs = ContentService();
  var as = UserService();
  var ss = ScoringService();
  final SpeechToText speechToText = SpeechToText();
  var searchData = "".obs;
  bool speechEnabled = false;
  String wordSpoken = '';
  double confidenceLevel = 0.0;
  Stream<User?> get authStream => as.authRef.authStateChanges();
  var authStreamResult = Rxn<Map<String, dynamic>?>();
  late UserModel userModel;

  @override
  void onInit() {
    // audioService.audioPlayer.resume();
    initSpeech();
    super.onInit();
  }


  @override
  void onClose() {
    searchController.clear();
    super.onClose();
  }

  void toggleSearch() {
    isSearching.value = !isSearching.value;
  }

  void getUserData(){
    CombineLatestStream.combine2<User?, DocumentSnapshot<Map<String, dynamic>>?, Map<String, dynamic>?>(
      authStream,
      authStream.asyncMap((user) => user != null ? as.getAllUserData(user.uid).first : null),
          (authUser, userDataSnapshot) {
        var data = userDataSnapshot?.data();
        userModel = UserModel(
          uId: authUser?.uid ?? '',
          email: authUser?.email ?? '',
          role: data?['role'] ?? -1,
          nama: authUser?.displayName ?? '',
          absen: data?['absen'] ?? -1,
          kelas: data?['kelas'] ?? '',
          sekolah: data?['sekolah'] ?? '',
        );
        if (authUser == null){
          return null;
        }
        return {
          "authUser": authUser,
          "userData": data,
        };
      },
    ).listen((data) {
      authStreamResult.value = data ?? {
        "authUser": null,
        "userData": null,
      };
    },);
  }

  void searchContent({required String value}) {
    searchData.value = value;
  }

  void initSpeech() async {
    try {
      speechEnabled = await speechToText.initialize();
    } catch (e) {
        log(e.toString());
    }
  }

  void startListening() async {
    isListening.value = true;
    try {
      await speechToText.listen(
        listenOptions: SpeechListenOptions(
          partialResults: true,
          cancelOnError: false,
          listenMode: ListenMode.search,
        ),
        onResult: (onSpeechResult),
      );
    } catch (e) {
      log(e.toString());
      isListening.value = false;
    }
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    try {
      if (result.finalResult) {
        confidenceLevel = result.confidence;
        searchController.text = result.recognizedWords;
        stopListening();
        searchContent(value: result.recognizedWords); //ini pr
      }
    } catch (e) {
      log(e.toString());
      stopListening();

    }
  }

  void stopListening() async {
    isListening.value = false;
    try {
      await speechToText.stop();
    } catch (e) {
      log(e.toString());
      isListening.value = false;
    }
  }
}
