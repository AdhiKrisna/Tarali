import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  late FirebaseAuth authRef;
  late FirebaseFirestore _fireStore;

  AuthService(){
    authRef = FirebaseAuth.instance;
    _fireStore = FirebaseFirestore.instance;
  }

  // Mengirim email verifikasi dan menyimpan data sementara di Firestore
  Future<bool> sendVerificationEmail({required String email, required String pass}) async {
    final tempUserCredential = await authRef.createUserWithEmailAndPassword(
      email: email,
      password: pass,
    );
    final tempUser = tempUserCredential.user;

    if (tempUser != null) {
      await tempUser.sendEmailVerification();

      await _fireStore.collection('temporaryUsers').doc(tempUser.uid).set({
        'email': email,
        'password': pass,
        'creationTime': DateTime.now(),
      });
      return true;
    }
    return false;
  }

  // Memeriksa status verifikasi dan membuat akun di Firebase Auth
  Future<bool> checkEmailVerification() async {
    final tempUser = authRef.currentUser;
    if (tempUser != null && tempUser.emailVerified) {
      await _fireStore.collection('temporaryUsers').doc(tempUser.uid).delete();
      return true;
    }
    return false;
  }

  // Menghapus akun sementara jika tidak diverifikasi dalam waktu tertentu
  Future<void> deleteTemporaryUsers() async {
    final tempUser = authRef.currentUser;
    final querySnapshot = await _fireStore.collection('temporaryUsers').doc(tempUser!.uid).get();
    await authRef.signInWithEmailAndPassword(
      email: querySnapshot['email'],
      password: querySnapshot['password'],
    );

    if (!tempUser.emailVerified) {
      await tempUser.delete();
      await querySnapshot.reference.delete();
    }
  }

  Future<bool> login({
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

  Future<void> logout()async{
    await authRef.signOut();
  }
}