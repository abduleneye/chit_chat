import 'dart:async';

import 'package:chit_chat/features/chat/domain/chat_repos/chat_service_repository.dart';
import 'package:chit_chat/features/chat/presentation/chat_bloc/chat_events.dart';
import 'package:chit_chat/features/chat/presentation/chat_bloc/chat_states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBloc extends Bloc<ChatEvents, ChatStates> {

   StreamSubscription<List<Map<String, dynamic>>>? _messageSubscription;

   ChatBloc(ChatServiceRepository chatRepo): super(LoadingMessages()){


    on<SendMessage>((event, emit) async {
       await chatRepo.sendMessage(event.receiverID, event.message);
    });

    on<DeleteMessage>((event, emit) async {
      await chatRepo.deleteMessage(event.messageId, event.receiverId);
    });

    on<EditMessage>((event, emit) async {
      await chatRepo.editMessage(event.messageId, event.receiverId, event.newMessage);
    });


    on<GetMessage>((event, emit) async{
      _messageSubscription = chatRepo.getMessage(event.currentUserID, event.recipientsUserID).listen(
              (messages){
                print("Stream emitted: ${messages.toList()} messages");
                add(MessageReceived(message: messages));
      },
        onError: (error) {
          print('Stream error: $error');
        },
        onDone: () {
          print('Stream closed');
        },
      );

    });

    on<MessageReceived>((event, emit){
      emit(MessagesLoaded(messages: event.message));

    });

  }

   @override
   Future<void> close() {
     _messageSubscription?.cancel(); // <- this counts as usage
     return super.close();
   }

}