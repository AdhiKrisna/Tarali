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
  bool speechEnabled = false;
  String wordSpoken = '';
  double confidenceLevel = 0.0;
  Stream<User?> get authStream => as.authRef.authStateChanges();
  var authStreamResult = Rxn<Map<String, dynamic>?>();
  late UserModel userModel;

  @override
  void onInit() {
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
        print(data);
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

  void searchContent() {
    try {
      if (searchController.text.isNotEmpty) {
        //print(searchController.text + ' from controller');
        cs.getSearchContent(searchController.text).listen((event) {
          //print(event);
        });
      } else {
        //print('Search is empty');
      }
    } catch (e) {
      //print('Error in searchContent: $e');
    }
  }

  void initSpeech() async {
    try {
      speechEnabled = await speechToText.initialize();
      //print(speechEnabled);
    } catch (e) {
      //print('Error in initSpeech: $e');
    }
  }

  void startListening() async {
    isListening.value = true;
    try {
      //print('isListening issss: ${isListening.value}');
      await speechToText.listen(
        listenOptions: SpeechListenOptions(
          // autoPunctuation: true,
          partialResults: true,
          cancelOnError: false,
          listenMode: ListenMode.search,
        ),
        onResult: (onSpeechResult),
      );
    } catch (e) {
      //print('Error in startListening: $e');
      isListening.value = false;
    }
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    try {
      if (result.finalResult) {
        confidenceLevel = result.confidence;
        //print(confidenceLevel);
        searchController.text = result.recognizedWords;
        //print(searchController.text + ' from speech to text');
        stopListening();
        searchContent(); //ini pr
      }
    } catch (e) {
      stopListening();
      //print('Error in onSpeechResult: $e');
    }
  }

  void stopListening() async {
    isListening.value = false;
    try {
      //print('isListening issss: ${isListening.value}');
      await speechToText.stop();
    } catch (e) {
      isListening.value = false;
      //print('Error in stopListening: $e');
    }
  }
}
