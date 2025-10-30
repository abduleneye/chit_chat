import 'dart:async';

import 'package:chit_chat/features/chat/domain/chat_repos/chat_service_repository.dart';
import 'package:chit_chat/features/chat/presentation/users_bloc/users_event.dart';
import 'package:chit_chat/features/chat/presentation/users_bloc/users_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersBloc extends Bloc<UsersEvents, UsersStates> {

  StreamSubscription<List<Map<String, dynamic>>>? _chatUsersSubscription;

  UsersBloc(ChatServiceRepository chatRepo): super(LoadingUsers()){

    //Actually needed
    on<GetAllUsersStreamExcludingBlocked>((event, emit){
      _chatUsersSubscription = chatRepo.getAllUsersStreamExcludingBlocked().listen(
            (allUsers) {
          print('Stream emitted: $allUsers');
          add(GottenAllUsersStreamExcludingBlocked(users: allUsers));
        },
        onError: (error) {
          print('Stream error: $error');
        },
        onDone: () {
          print('Stream closed');
        },
      );
    });
    on<GottenAllUsersStreamExcludingBlocked>((event, emit){
      emit(UsersLoaded(users: event.users));

    });

    //Testing
    on<GetAllUsersStreamExcludingCurrentUser>((event, emit){
      _chatUsersSubscription = chatRepo.getAllUsersStreamExcludingBlocked().listen(
            (allUsers) {
          print('Stream emitted: $allUsers');
          add(GottenAllUsersStreamExcludingCurrentUser(users: allUsers));
        },
        onError: (error) {
          print('Stream error: $error');
        },
        onDone: () {
          print('Stream closed');
        },
      );
    });
    on<GottenAllUsersStreamExcludingCurrentUser>((event, emit){
      emit(UsersLoaded(users: event.users));
    });



  }

}