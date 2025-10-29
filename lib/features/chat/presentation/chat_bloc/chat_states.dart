abstract class ChatStates{


}

class ChatInitial extends ChatStates{

}

class LoadingUsers extends ChatStates{

}

class UsersLoaded extends ChatStates{
  final List<Map<String, dynamic>> users;
  UsersLoaded({required this.users});
}

class UsersLoadingError extends ChatStates{
  final String errorMessage;
  UsersLoadingError({required this.errorMessage});
}