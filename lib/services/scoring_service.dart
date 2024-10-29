
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tarali/models/scoring_model.dart';

class ScoringService{
  late FirebaseFirestore _fireStore;
  late FirebaseStorage _fireStorage;

  ScoringService(){
    _fireStore = FirebaseFirestore.instance;
    _fireStorage = FirebaseStorage.instance;
  }

  Future<bool> createScoringTemplate({required dynamic argument})async{
    CollectionReference collectionRef = _fireStore.collection('scoring');
    var snapshot = await collectionRef
        .where('uId', isEqualTo: argument['uId'])
        .where('contentId', isEqualTo: argument['contentId'])
        .limit(1)
        .get();
    if(snapshot.docs.isEmpty){
      try{
        await collectionRef.add(
            {
              'uId': argument['uId'],
              'sekolah': argument['sekolah'],
              'contentId': argument['contentId'],
              'nama': argument['nama'],
              'title': argument['title'],
              'cover': argument['coverDashboard'],
              'absen': argument['absen'],
              'kelas': argument['kelas'],
            }
        );
        return true;
      } catch (e){
        return false;
      }
    }else{
      return true;
    }
  }

  Future<bool> checkCanReadTest({
    required String uid,
    required String contentId
  })async{
    var snapshot = await _fireStore.collection('scoring')
        .where('uId', isEqualTo: uid)
        .where('contentId', isEqualTo: contentId)
        .limit(1)
        .get();
    return snapshot.docs.isNotEmpty;
  }

  Future<bool> checkCanQuiz({
    required String uid,
    required String contentId
  })async{
    var snapshot = await _fireStore.collection('scoring')
        .where('uId', isEqualTo: uid)
        .where('contentId', isEqualTo: contentId)
        .limit(1)
        .get();
    if(snapshot.docs.isNotEmpty && snapshot.docs[0].data().containsKey('readTest')){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> setQuizTestAssignment({required dynamic argument}) async{
    CollectionReference collectionRef = _fireStore.collection('scoring');
    var snapshot = await collectionRef
        .where('uId', isEqualTo: argument['uId'])
        .where('contentId', isEqualTo: argument['contentId'])
        .limit(1)
        .get();
    try{
      DocumentReference docRef = snapshot.docs.first.reference;
      await docRef.update(
          {
            'quiz.score': argument['quizScore'],
            'quiz.jawaban': argument['quizJawaban'],
            'quiz.waktuPengerjaan': argument['counterSecond'],
          }
      );
      return true;
    } catch (e){
      return false;
    }
  }

  Future<bool> setReadTestAssignment({
    required String downloadUrl,
    required dynamic argument
  }) async{
    CollectionReference collectionRef = _fireStore.collection('scoring');
    var snapshot = await collectionRef
        .where('uId', isEqualTo: argument['uId'])
        .where('contentId', isEqualTo: argument['contentId'])
        .limit(1)
        .get();
    try{
      DocumentReference docRef = snapshot.docs.first.reference;
      await docRef.update(
          {
            'readTest.score': 0.0,
            'readTest.source': downloadUrl,
            'readTest.message': '',
          }
      );
      return true;
    } catch (e){
      return false;
    }
  }

  Future<bool> uploadTestReadAssignment({
    required String path,
    required dynamic argument,
  })async{
    File file = File(path);
    try{
      bool v = false;
      final storageRef = _fireStorage.ref();
      final fileRef = storageRef.child('konten/${argument['pathStorage']}/assignment/${argument['uId']}.wav');
      await fileRef.putFile(file);

      String downloadUrl = await fileRef.getDownloadURL();
      await setReadTestAssignment(
        downloadUrl: downloadUrl,
        argument: argument,
      ).then((value){
        v = value;
      });
      return v;
    }catch (e){
      return false;
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>  getAllHistory(String uId) {
    try{
      return _fireStore.collection('scoring').where('uId', isEqualTo: uId).snapshots();
    }catch (e){
      return const Stream.empty();
    }
  }

  List<ScoringModel> getAllHistoryData({required List<QueryDocumentSnapshot> data}){
    return data.map((e){
      return ScoringModel(
        uId: e['uId'],
        contentId: e['contentId'],
        cover: e['cover'],
        nama: e['nama'],
        absen: e['absen'],
        kelas: e['kelas'],
        title: e['title'],
        quizScore: (e.data() as Map<String, dynamic>).containsKey('quiz') ? e['quiz']['score'] : 0,
        readTestScore: (e.data() as Map<String, dynamic>).containsKey('readTest') ? e['readTest']['score'] : 0,
        readTestMessage: (e.data() as Map<String, dynamic>).containsKey('readTest') ? e['readTest']['message'] : '',
        readTestSource: (e.data() as Map<String, dynamic>).containsKey('readTest') ? e['readTest']['source'] : '',
        sekolah: e['sekolah'],
      );
    }).toList();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllReadTestAssignment({
    required String contentId,
    required String sekolah,
  }) {
    try{
      return _fireStore.collection('scoring')
          .where('contentId', isEqualTo: contentId)
          .where('sekolah', isEqualTo: sekolah)
          .snapshots();
    }catch (e){
      return const Stream.empty();
    }
  }

  List<ScoringModel> getAllReadTestAssignmentData({required List<QueryDocumentSnapshot> data}){
    return data.map((e){
      return ScoringModel(
        uId: e['uId'],
        contentId: e['contentId'],
        cover: e['cover'],
        absen: e['absen'],
        nama: e['nama'],
        kelas: e['kelas'],
        title: e['title'],
        quizScore: (e.data() as Map<String, dynamic>).containsKey('quiz') ? e['quiz']['score'] : 0,
        readTestScore: (e.data() as Map<String, dynamic>).containsKey('readTest') ? e['readTest']['score'] : 0,
        readTestMessage: (e.data() as Map<String, dynamic>).containsKey('readTest') ? e['readTest']['message'] : '',
        readTestSource: (e.data() as Map<String, dynamic>).containsKey('readTest') ? e['readTest']['source'] : '',
        sekolah: e['sekolah'],
      );
    }).toList();
  }

  Future<bool> setReadTestScore({
    required dynamic argument,
    required double score,
    required String message,
  })async{
    CollectionReference collectionRef = _fireStore.collection('scoring');
    var snapshot = await collectionRef
        .where('uId', isEqualTo: argument['uId'])
        .where('contentId', isEqualTo: argument['contentId'])
        .limit(1)
        .get();
    try{
      DocumentReference docRef = snapshot.docs.first.reference;
      await docRef.update(
          {
            'readTest.score': score,
            'readTest.message': message,
          }
      );
      return true;
    } catch (e){
      return false;
    }
  }
}