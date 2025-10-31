import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthEvent{

}

class SignInWithEmailAndPassword extends AuthEvent {
  final String email;
  final String password;

   SignInWithEmailAndPassword(
  { required this.email,
    required this.password});
}

class SignUpWithEmailAndPassword extends AuthEvent {
  final String email;
  final String password;
  final String confirmPassword;

  SignUpWithEmailAndPassword(
      { required this.email,
        required this.password,
        required this.confirmPassword,
      });
}

class Logout extends AuthEvent{

}

class AuthUserChanged extends AuthEvent {
  final User? user;
  AuthUserChanged(this.user);
}

