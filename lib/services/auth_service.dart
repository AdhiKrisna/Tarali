import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  late FirebaseAuth authRef;

  AuthService(){
    authRef = FirebaseAuth.instance;
  }

  Future<User?> register({
    required String email,
    required String pass,
  })async{
    User? user;
    try{
      user = (
      await authRef.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      )
      ).user;
    }on FirebaseAuthException catch (e) {
      e.toString();
    }
    return user;
  }

  Future<void> logout()async{
    await authRef.signOut();
  }
}