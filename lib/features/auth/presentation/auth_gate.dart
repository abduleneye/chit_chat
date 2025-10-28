import 'package:chit_chat/features/auth/data/auth_service.dart';
import 'package:chit_chat/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:chit_chat/features/auth/presentation/auth_bloc/auth_state.dart';
import 'package:chit_chat/features/auth/presentation/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/home_page.dart';

class AuthGate extends StatelessWidget {
   AuthGate({super.key});

  final authRepo = AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, authState){
          // 🔥 Show toast when an authentication error occurs
          if (authState is SignInError) {
            Fluttertoast.showToast(
              msg: authState.errorMessage,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.blue,
            );
          }
          else if (authState is SignUpError) {
            Fluttertoast.showToast(
              msg: authState.errorMessage,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.blue,
            );
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(builder: (context, authState){
          if(authState is UserAuthenticated){
            if(authState.currentUser != null){
              return  HomePage();
            }
            else {
              return  LoginOrRegister();

            }
          }
          // if(authState is Loading){
          //   return Center(child: Text("Loading"),);
          // }

          else{
            return  LoginOrRegister();
          }

        },
      ),
      // body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
      //     builder: (context, snapshot){
      //   // user is logged in
      //   if(snapshot.hasData){
      //     return  HomePage();
      //   } else{
      //     return LoginOrRegister();
      //   }
      //     }
      // ),
    ));
  }
}
//eneye53@gmail.com
