import 'dart:async';

import 'package:chit_chat/features/chat/domain/chat_repos/chat_service_repository.dart';
import 'package:chit_chat/features/chat/presentation/users_bloc/users_event.dart';
import 'package:chit_chat/features/chat/presentation/users_bloc/users_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersBloc extends Bloc<UsersEvents, UsersStates> {

  StreamSubscription<List<Map<String, dynamic>>>? _chatUsersSubscription;

  UsersBloc(ChatServiceRepository chatRepo): super(LoadingUsers()){
    _chatUsersSubscription = chatRepo.getAllUsersExcludingBlocked().listen(
          (allUsers) {
        print('Stream emitted: $allUsers');
        add(GetAllUsersStreamExcludingBlocked(users: allUsers));
      },
      onError: (error) {
        print('Stream error: $error');
      },
      onDone: () {
        print('Stream closed');
      },
    );



    on<GetAllUsersStreamExcludingBlocked>((event, emit){
      emit(UsersLoaded(users: event.users));
    });


  }

}