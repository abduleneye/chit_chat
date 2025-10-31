import 'dart:async';

import 'package:chit_chat/features/chat/domain/chat_repos/chat_service_repository.dart';
import 'package:chit_chat/features/chat/presentation/block_users_bloc/block_users_event.dart';
import 'package:chit_chat/features/chat/presentation/block_users_bloc/block_users_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlockUsersBloc extends Bloc<BlockUsersEvent, BlockUsersState>{

  StreamSubscription<List<Map<String, dynamic>>>? _blockedUsersStreamSubscription;

  BlockUsersBloc(ChatServiceRepository chatRepo):super(BlockedUsersInitial()){

    on<LoadBlockedUsers>((event, emit){
      emit(Loading());
      _blockedUsersStreamSubscription = chatRepo.getAllBlockedUsers(event.forUserId).listen(
              (onData){
                add(LoadedBlockedUsers(blockedUsers: onData));

      });
    });

    on<LoadedBlockedUsers>((event, emit)async{
      emit(Loaded(blockedUsers: event.blockedUsers));
    });
    on<BlockUser>((event, emit)async{
      await chatRepo.blockUser(event.userToBeBlockedId);
    });

    on<UnBlockUser>((event, emit)async{
      await chatRepo.unBlockUser(event.userToBeUnBlockedId);
    });

  }


  @override
  Future<void> close() {
    _blockedUsersStreamSubscription?.cancel(); // <- this counts as usage
    return super.close();
  }
}