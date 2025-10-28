import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/home_page.dart';
import 'auth_bloc/auth_bloc.dart';
import 'auth_bloc/auth_state.dart';
import 'login_or_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, authState) {
          if (authState is SignInError || authState is SignUpError) {
            final errorMessage = (authState is SignInError)
                ? authState.errorMessage
                : (authState as SignUpError).errorMessage;

            Fluttertoast.showToast(
              msg: errorMessage,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white,
            );
          }
        },
        builder: (context, authState) {
          if (authState is UserAuthenticated &&
              authState.currentUser != null) {
            return HomePage();
          }

          if (authState is UserUnAuthenticated) {
            return LoginOrRegister();
          }

          // 🔥 Handle all loading / unknown / initializing states here
          if (authState is SignInLoading || authState is SignUpLoading) {
            // Keep user on same screen (so button spinner remains visible)
            return LoginOrRegister();
          }

          // 👇 For the very first time app launches (AuthInitial or stream resolving)
          return const  LoginOrRegister();
        },
      ),
    );
  }
}
