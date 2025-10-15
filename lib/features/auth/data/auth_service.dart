import 'package:chit_chat/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
class AuthService{

  //instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;


  //get current user
  User? getCurrentUser(){
    return _auth.currentUser;

  }

  //sign in
  Future<UserCredential> signInWithemailAndPassword(String email, password) async{
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      // save user info in a seperate doc

      try {
        await _fireStore.collection("Users").doc(userCredential.user!.uid).set({
          'uid': userCredential.user!.uid,
          'email': userCredential.user!.email,
        });
        print("User added to Firestore ✅");
      } catch (e) {
        print("Firestore error: $e");
      }

//eneye53@gmail.com
      return userCredential;
    } on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }

  //sign up
  Future<UserCredential> signUpWitEmailAndPassWord(
      String email, password
      )async {
    try{
      //create user
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email,
          password: password);

      // save user info in a seperate doc
      try {
        await _fireStore.collection("Users").doc(userCredential.user!.uid).set({
          'uid': userCredential.user!.uid,
          'email': userCredential.user!.email,
        });
        print("User added to Firestore ✅");
      } catch (e) {
        print("Firestore error: $e");
      }

      return userCredential;
    } on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }

  //sign out
  Future<void> signOut() async{
    return await _auth.signOut();
  }

  //errors
}