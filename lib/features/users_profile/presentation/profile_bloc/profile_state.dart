sealed class ProfileState {

}

class ProfileInitial extends ProfileState{


}

class LoadingProfile extends ProfileState{

}

class LoadedProfile extends ProfileState {
  final Map<String, dynamic> profile;
  LoadedProfile({required this.profile});


}

class LoadingProfileError extends ProfileState {

}