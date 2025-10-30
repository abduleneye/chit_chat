abstract class UsersEvents{
}

class GetAllUsersStreamExcludingCurrentUser extends UsersEvents {

}
class GottenAllUsersStreamExcludingCurrentUser extends UsersEvents {
  final List<Map<String, dynamic>> users;
  GottenAllUsersStreamExcludingCurrentUser({required this.users});
}

class GetAllUsersStream extends UsersEvents {
  final List<Map<String, dynamic>> users;
  GetAllUsersStream({required this.users});
}

class GetAllUsersStreamExcludingBlocked extends UsersEvents {
}

class GottenAllUsersStreamExcludingBlocked extends UsersEvents {
  final List<Map<String, dynamic>> users;
  GottenAllUsersStreamExcludingBlocked({required this.users});
}
