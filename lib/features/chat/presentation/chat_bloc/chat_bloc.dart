import 'dart:async';

import 'package:chit_chat/features/chat/domain/chat_repos/chat_service_repository.dart';
import 'package:chit_chat/features/chat/presentation/chat_bloc/chat_events.dart';
import 'package:chit_chat/features/chat/presentation/chat_bloc/chat_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBloc extends Bloc<ChatEvents, ChatStates> {

   StreamSubscription<List<Map<String, dynamic>>>? _chatUsersSubscription;

  ChatBloc(ChatServiceRepository chatRepo): super(LoadingUsers()){

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

   @override
   Future<void> close() {
     _chatUsersSubscription?.cancel(); // <- this counts as usage
     return super.close();
   }

}