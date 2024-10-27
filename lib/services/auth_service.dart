import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  late FirebaseAuth _authRef;
  late FirebaseFirestore _firestore;

  AuthService(){
    _authRef = FirebaseAuth.instance;
    _firestore = FirebaseFirestore.instance;
  }

  Future<bool> register({
    required String email,
    required String pass,
  })async{
    User? user;
    try{
      user = (
      await _authRef.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      )
      ).user;
      if(user != null){
        await _firestore.collection('unverifiedUsers').doc(user.uid).set({
          'email': email,
          'creationTime': DateTime.now(),
          'isVerified': false,
        });
        await user.sendEmailVerification();
        await _authRef.signOut();
        return true;
      }
      return false;
    }on FirebaseAuthException catch (e) {
      e.toString();
      return false;
    }
  }

  Future<void> checkAndDeleteUnverifiedUser() async {
    final user = _authRef.currentUser;
    if (user != null && !user.emailVerified) {
      final snapshot = await _firestore.collection('unverifiedUsers').doc(user.uid).get();

      if (snapshot.exists) {
        final creationTime = snapshot['creationTime'].toDate();
        final currentTime = DateTime.now();
        const verificationDeadline = Duration(hours: 24);

        if (currentTime.difference(creationTime) > verificationDeadline) {
          await user.delete();
          await snapshot.reference.delete();
        }
      }
    }
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    bool value = false;
    try {
      await _authRef.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await checkAndDeleteUnverifiedUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        e.toString();
      }
    }
    return value;
  }

  Future<void> logout()async{
    await _authRef.signOut();
  }
}