abstract class UsersEvents{
}

class GetAllUsersStream extends UsersEvents {
  final List<Map<String, dynamic>> users;
  GetAllUsersStream({required this.users});
}

class GetAllUsersStreamExcludingBlocked extends UsersEvents {
  final List<Map<String, dynamic>> users;
  GetAllUsersStreamExcludingBlocked({required this.users});
}
