class BlockUsersEvent{

}

class LoadBlockedUsers extends BlockUsersEvent{
  final String forUserId;
  LoadBlockedUsers({required this.forUserId});
}

class LoadedBlockedUsers extends BlockUsersEvent{
  final List<Map<String, dynamic>> blockedUsers;
  LoadedBlockedUsers({required this.blockedUsers});

}

class BlockUser extends BlockUsersEvent{
  final String userToBeBlockedId;
  BlockUser({required this.userToBeBlockedId});


}

class UnBlockUser extends BlockUsersEvent{
  final String userToBeUnBlockedId;
  UnBlockUser({required this.userToBeUnBlockedId});

}