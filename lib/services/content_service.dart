
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tarali/models/content_model.dart';
import 'package:tarali/models/kuis_model.dart';
import 'package:tarali/models/warm_up_model.dart';

class ContentService {
  late FirebaseFirestore fireStore;
  late Reference storageRef;

  ContentService() {
    fireStore = FirebaseFirestore.instance;
    storageRef = FirebaseStorage.instance.ref();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllContent() {
    return FirebaseFirestore.instance.collection('content').snapshots();
  }

  List<String> getSearchContentTitle(String search) {
    search = search.toLowerCase().replaceAll(' ', '');
    List<String> contentSnapshots = [];
    FirebaseFirestore.instance.collection('content').get().then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        if(doc['title'].toString().toLowerCase().replaceAll(' ', '').contains(search) ){
          //print(doc['title']);
          contentSnapshots.add(doc['title']);
        }
      }
      //print(contentSnapshots);
    });
    return contentSnapshots;
  }
  Stream<QuerySnapshot<Map<String, dynamic>>> getSearchContent(String search) {
    List<String> contentSnapshots = getSearchContentTitle(search);
    //print(contentSnapshots);
    try {
      return FirebaseFirestore.instance
        .collection('content')
        .where('title', arrayContainsAny: contentSnapshots)
        .snapshots();
    } catch (e) {
      //print('Error fetching search content: $e');
      return const Stream.empty();
    }
  }
  // Stream<QuerySnapshot<Map<String, dynamic>>> getSearchContent(String search) {
  //   return FirebaseFirestore.instance
  //       .collection('content')
  //       .where('title', isGreaterThanOrEqualTo: search)
  //       .where('title', isLessThanOrEqualTo: '$search\uf8ff')
  //       .snapshots();
  // }


List<ContentModel> getAllContentData(
      {required List<QueryDocumentSnapshot> data}) {
    int noSoal = 1;
    WarmUpModel pemanasan;
    return data.map((e){
      noSoal = 1;
      List<KuisModel> kuisModel =[];
      List<dynamic> kuis = [];

      kuis = e['kuis'];
      for(var i in kuis){
        kuisModel.add(
          KuisModel(
            noSoal: noSoal,
            soal: i['soal'],
            jawaban: i['jawaban'],
            opsi: i['opsi'],
          )
        );
        noSoal++;
      }
      pemanasan = WarmUpModel(
        jawaban: e['pemanasan']['jawaban'],
        opsi: e['pemanasan']['opsi'],
      );
      return ContentModel(
        title: e['title'] ?? 'Test',
        pathStorage: e['pathStorage'] ?? 'null',
        coverDashboard: e['coverDashboard'] ?? 'null',
        cover: e['cover'] ?? 'null',
        pageTotal: e['pageTotal'] ?? 0,
        ayoBercerita: e['ayoBercerita'] ?? 'null',
        kuis: kuisModel,
        pemanasan: pemanasan,
      );
    }).toList();
  }

  Future<String> getVideoUrl(String path) async {
    return storageRef.child('konten/$path/video/video.mp4').getDownloadURL();
  }

  Future<String> getAudioUrl(String path) async {
    return storageRef.child('konten/$path/audio/audio.mp3').getDownloadURL();
  }

  Future<String> getDetailCover(String path) async {
    return storageRef.child('konten/$path/baca/cover.png').getDownloadURL();
  }

  Future<List<String>> getAllReadContent({
    required String path,
    required int totalPage,
  }) async {
    List<String> data = [];
    for (var i = 1; i <= totalPage; i++) {
      data.add(
          await storageRef.child('konten/$path/baca/$i.png').getDownloadURL());
    }
    return data;
  }
  
  Future<String> getWarmUpImageBefore(String path){
    return storageRef
        .child('konten/$path/tebakgambar/before.jpg')
        .getDownloadURL();
  }

  Future<String> getWarmUpImageAfter(String path){
    return storageRef
        .child('konten/$path/tebakgambar/after.jpg')
        .getDownloadURL();
  }
}
