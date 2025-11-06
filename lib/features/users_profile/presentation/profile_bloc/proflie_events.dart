sealed class ProfileEvent{

}

class GetProfile extends ProfileEvent{


}

class GottenProfile extends ProfileEvent{
  final Map<String, dynamic> profile;
  GottenProfile({required this.profile});


}


class UpdateProfilePicture extends ProfileEvent{


}

