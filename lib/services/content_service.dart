import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tarali/models/content_model.dart';

class ContentService {
  late FirebaseFirestore firestore;
  ContentService() {
    firestore = FirebaseFirestore.instance;
  }
  Stream<QuerySnapshot<Map<String, dynamic>>> getAllContent() {
    return FirebaseFirestore.instance.collection('content').snapshots();
  }

  List<ContentModel> getAllContentData(
      {required List<QueryDocumentSnapshot> data}) {
    return data.map((e) => ContentModel(
              title: e['title'] ?? 'Test',
              pathStorage: e['pathStorage'] ?? 'null',
              coverDashboard: e['coverDashboard'] ?? 'null',
              cover: e['cover'] ?? 'null',
            )).toList();
  }

  Future<String> getDetailCover(String title) async {
    final FirebaseStorage storage = FirebaseStorage.instance;

    try {
      String formattedTitle = title.toLowerCase().replaceAll(' ', '');
      String path = 'konten/$formattedTitle/baca/cover.png';
      print('Accessing path: $path');

      // Mendapatkan URL dari Firebase Storage
      String downloadURL = await storage.ref(path).getDownloadURL();
      print('Download URL: $downloadURL');

      return downloadURL;
    } catch (e) {
      throw Exception('File not found or inaccessible: $e');
    }
  }
}
