import 'package:firebase_auth/firebase_auth.dart' as fb;

abstract class AuthServiceRepo{

  Stream<fb.User?> get user;

  Future<fb.UserCredential> signUpWitEmailAndPassWord(
      String email,
      password
      );

  Future<fb.UserCredential> signInWithEmailAndPassword(String email, password);

  Future<void> signOut();
}