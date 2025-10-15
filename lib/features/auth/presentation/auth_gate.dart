import 'package:chit_chat/features/auth/presentation/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
        // user is logged in
        if(snapshot.hasData){
          return  HomePage();
        } else{
          return LoginOrRegister();
        }
          }
      ),
    );
  }
}
