sealed class BlockUsersState{


}

class BlockedUsersInitial extends BlockUsersState{

}

class Loading extends BlockUsersState{

}

class Loaded extends BlockUsersState{
  final List<Map<String, dynamic>> blockedUsers;
  Loaded({required this.blockedUsers});

}