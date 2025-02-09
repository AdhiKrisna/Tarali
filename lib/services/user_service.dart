import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class UserService{
  late FirebaseAuth authRef;
  late FirebaseFirestore _fireStore;

  UserService(){
    authRef = FirebaseAuth.instance;
    _fireStore = FirebaseFirestore.instance;
  }

  Future<bool> sendVerificationEmail({
    required String email,
    required String nama,
    required String sekolah,
    required String pass,
  }) async {
    try{
      final tempUserCredential = await authRef.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      final tempUser = tempUserCredential.user;
      await tempUser?.sendEmailVerification();

      await _fireStore.collection('temporaryUsers').doc(tempUser?.uid).set({
        'email': email,
        'password': pass,
        'nama': nama,
        'sekolah': sekolah,
        'creationTime': DateTime.now(),
      });
      return true;
    } on FirebaseAuthException catch (e) {
      e.toString();
    }
    return false;
  }

  Future<bool> checkEmailVerification() async {
    final tempUser = authRef.currentUser;
    if (tempUser != null && tempUser.emailVerified) {
      final querySnapshot = await _fireStore.collection('temporaryUsers').doc(tempUser.uid).get();
      await createUserData(
        id: tempUser.uid,
        email: querySnapshot['email'],
        nama: querySnapshot['nama'],
        sekolah: querySnapshot['sekolah'],
        role: 1,
      );
      await tempUser.updateDisplayName(querySnapshot['nama']);
      await _fireStore.collection('temporaryUsers').doc(tempUser.uid).delete();
      return true;
    }
    return false;
  }

  Future<void> deleteTemporaryUsers() async {
    final tempUser = authRef.currentUser;
    final querySnapshot = await _fireStore.collection('temporaryUsers').doc(tempUser!.uid).get();
    await tempUser.delete();
    await querySnapshot.reference.delete();
  }

  Future<void> createUserData({
    required String id,
    required String email,
    required String nama,
    required String sekolah,
    required int role,
    int absen = -1,
    String kelas = '-1 a',
  })async{
    // Inisialisasi Firebase Messaging
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    // Dapatkan token FCM
    String? fcmToken = await messaging.getToken();
    await _fireStore.collection('user').doc(id).set({
      'email': email,
      'nama': nama,
      'sekolah': sekolah,
      'role': role,
      'absen': absen,
      'kelas': kelas,
      'fcmToken': fcmToken,
      'isFinishedRead': false,
      'creationTime': DateTime.now(),
    });
  }

  Future<bool> loginTeacher({
    required String email,
    required String password,
  }) async {
    bool value = false;
    try {
      await authRef.signInWithEmailAndPassword(
        email: email,
        password: password,
      ).then((v) async {
        if(v.user != null && v.user!.emailVerified){
          await updateFCMToken(v.user!.uid);
          value = true;
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        e.toString();
      }
    }
    return value;
  }

  Future<bool> registerStudent({
    required String nama,
    required String kelas,
    required int absen,
    required String sekolah,
  }) async {
    bool value = false;
    User? user;
    String email = '${nama.removeAllWhitespace.toLowerCase()}_$absen@student.${sekolah.removeAllWhitespace.toLowerCase()}.id';
    String pass = '12345678abcde';
    try {
      user = (
          await authRef.createUserWithEmailAndPassword(
            email: email,
            password: pass,
          )
      ).user;
      if (user != null) {
        await user.updateDisplayName(nama);
        await createUserData(
          id: user.uid,
          email: email,
          nama: nama,
          sekolah: sekolah,
          role: 0,
          absen: absen,
          kelas: kelas,
        );
        value = true;
      }
    } on FirebaseAuthException catch (e) {
      e.toString();
    }
    return value;
  }

  Future<bool> loginStudent({
    required String nama,
    required String absen,
    required String sekolah,
  }) async {
    bool value = false;
    String email = '${nama.removeAllWhitespace.toLowerCase()}_$absen@student.${sekolah.removeAllWhitespace.toLowerCase()}.id';
    String pass = '12345678abcde';
    try {
      await authRef.signInWithEmailAndPassword(
        email: email,
        password: pass,
      ).then((v) async {
        final user = v.user;
        if(user != null){
          await updateFCMToken(user.uid);
          value = true;
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        e.toString();
      }
    }
    return value;
  }

  Future<void> updateFCMToken(String userId) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? newToken = await messaging.getToken();

    if (newToken != null) {
      await FirebaseFirestore.instance.collection('user').doc(userId).update({
        'fcmToken': newToken,
      });
    }
  }

  Future<void> logout()async{
    await authRef.signOut();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getAllUserData(String uId) {
    return _fireStore.collection('user').doc(uId).snapshots();
  }
}