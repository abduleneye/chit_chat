sealed class UsersStates{

}

class LoadingUsers extends UsersStates{
}
class UsersLoaded extends UsersStates{
  final List<Map<String, dynamic>> users;
  UsersLoaded({required this.users});
}
class UsersLoadingError extends UsersStates{
  final String errorMessage;
  UsersLoadingError({required this.errorMessage});
}

