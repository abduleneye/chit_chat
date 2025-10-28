import 'package:chit_chat/features/auth/domain/auth_service_repo.dart';
import 'package:chit_chat/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class AuthService extends AuthServiceRepo{

  //instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;


  //get current user
  fb.User? getCurrentUser(){
    return _auth.currentUser;

  }

  @override
  //sign up
  Future<UserCredential> signUpWitEmailAndPassWord(
      String email,
      password
      )async {
    try{
      //create user
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email,
          password: password);
      Fluttertoast.showToast(msg: "Login");
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

      await _auth.signOut();

      return userCredential;
    } on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }


  @override
  //sign in
  Future<UserCredential> signInWithEmailAndPassword(String email, password) async{
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );

//eneye53@gmail.com
      return userCredential;
    } on FirebaseAuthException catch(e){
      // Fluttertoast.showToast(
      //   msg: e.toString(),
      //   toastLength: Toast.LENGTH_SHORT,
      //   gravity: ToastGravity.BOTTOM,
      //   backgroundColor: Colors.red,
      //   textColor: Colors.blue,
      // );
      throw Exception(e.code);
    }
  }


  //sign out
  @override
  Future<void> signOut() async{
     await _auth.signOut();
  }



  @override
  Stream<fb.User?> get user =>  _auth.authStateChanges();



//errors
}