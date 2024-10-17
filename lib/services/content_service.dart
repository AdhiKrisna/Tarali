import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tarali/models/content_model.dart';

class ContentService{
  late FirebaseFirestore firestore;

  ContentService(){
    firestore = FirebaseFirestore.instance;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllContent(){
    return FirebaseFirestore.instance.collection('content').snapshots();
  }

  List<ContentModel> getAllContentData({required List<QueryDocumentSnapshot> data}){
    return data.map((e) => ContentModel(
      title: e['title'] ?? 'Test',
      pathStorage: e['pathStorage'] ?? 'null',
    )).toList();
  }

}