import 'dart:async';

import 'package:chit_chat/features/chat/domain/chat_repos/chat_service_repository.dart';
import 'package:chit_chat/features/users_profile/presentation/profile_bloc/profile_state.dart';
import 'package:chit_chat/features/users_profile/presentation/profile_bloc/proflie_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState>{
  StreamSubscription<Map<String, dynamic>>? _profileSubscription;

  ProfileBloc(ChatServiceRepository _chatRepo): super((ProfileInitial())){

    on<GetProfile>((event, emit){
      emit(LoadingProfile());
     _profileSubscription =  _chatRepo.getCurrentUserStream().listen(
         (user){
           print('User Stream emitted: $user');
           add(GottenProfile(profile: user));
         }
     );

    });

    on<GottenProfile>((event, emit){
      emit(LoadedProfile(profile: event.profile));
    });

  }
}