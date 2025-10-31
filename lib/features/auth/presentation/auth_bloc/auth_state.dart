import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState{

}

class UserAuthenticated  extends AuthState{
  final User? currentUser;
  UserAuthenticated({required this.currentUser});

}

class AuthInitial  extends AuthState{

}

class SignInLoading  extends AuthState{

}

class SignUpLoading  extends AuthState{

}

class UserUnAuthenticated  extends AuthState{

}

class SignInError extends AuthState{
  final String errorMessage;
  SignInError({required this.errorMessage});

}



class SignUpError extends AuthState {
  final String errorMessage;
  SignUpError({required  this.errorMessage});
}
class SignOutError extends AuthState {
  final String errorMessage;
  SignOutError({required  this.errorMessage});
}
