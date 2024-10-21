
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tarali/models/content_model.dart';
import 'package:tarali/models/kuis_model.dart';

class ContentService {
  late FirebaseFirestore firestore;
  late Reference storageRef;

  ContentService() {
    firestore = FirebaseFirestore.instance;
    storageRef = FirebaseStorage.instance.ref();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllContent() {
    return FirebaseFirestore.instance.collection('content').snapshots();
  }

  List<ContentModel> getAllContentData(
      {required List<QueryDocumentSnapshot> data}) {
    int noSoal = 1;
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
      return ContentModel(
        title: e['title'] ?? 'Test',
        pathStorage: e['pathStorage'] ?? 'null',
        coverDashboard: e['coverDashboard'] ?? 'null',
        cover: e['cover'] ?? 'null',
        pageTotal: e['pageTotal'] ?? 0,
        ayoBercerita: e['ayoBercerita'] ?? 'null',
        kuis: kuisModel,
      );
    }).toList();
  }

  Future<String> getVideoUrl(String path)async{
    return storageRef
        .child('konten/$path/video/video.mp4')
        .getDownloadURL();
  }
  
  Future<String> getAudioUrl(String path) async {
    return storageRef
        .child('konten/$path/audio/audio.mp3')
        .getDownloadURL();
  }

  Future<String> getDetailCover(String path) async {
    return storageRef
        .child('konten/$path/baca/cover.png')
        .getDownloadURL();
  }

  Future<List<String>> getAllReadContent({
    required String path,
    required int totalPage,
  })async{
    List<String> data = [];
    for(var i = 1; i <= totalPage; i++){
      data.add(await storageRef
          .child('konten/$path/baca/$i.png')
          .getDownloadURL()
      );
    }
    return data;
  }
}
