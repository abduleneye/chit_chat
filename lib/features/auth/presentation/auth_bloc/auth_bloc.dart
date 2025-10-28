import 'dart:async';

import 'package:chit_chat/features/auth/presentation/auth_bloc/auth_event.dart';
import 'package:chit_chat/features/auth/presentation/auth_bloc/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/auth_service_repo.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

    StreamSubscription<User?>? _userSubscription;

  AuthBloc(AuthServiceRepo authRepo): super(AuthInitial())
  {

//    StreamSubscription<User?>? _userSubscription;

    _userSubscription = authRepo.user.listen((user){

        add(AuthUserChanged(user));


    });

    //emit(Loading());

    on<SignUpWithEmailAndPassword>((event, emit) async{
      emit(SignUpLoading());
      try{
        final userCredential =  await authRepo.signUpWitEmailAndPassWord(event.email, event.password);
        emit(UserAuthenticated(currentUser: userCredential.user));
      } catch(e){
        emit(SignUpError(errorMessage: e.toString()));
      }
    }
    );

    on<SignInWithEmailAndPassword>((event, emit) async{
      emit(SignInLoading());
      try{
        final userCredential =  await authRepo.signInWithEmailAndPassword(event.email, event.password);
        emit(UserAuthenticated(currentUser: userCredential.user));
      } catch(e){
        emit(SignInError(errorMessage: e.toString()));

      }
    }
    );

    on<AuthUserChanged>((event, emit) async{
    if(event.user != null){
      emit(UserAuthenticated(currentUser: event.user));
    }else{
      emit(UserUnAuthenticated());

    }
    }
    );
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}