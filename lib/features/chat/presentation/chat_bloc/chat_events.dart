abstract class ChatEvents {}

class GetAllUsersStream extends ChatEvents {}

class GetAllUsersStreamExcludingBlocked extends ChatEvents {
  final List<Map<String, dynamic>> users;
  GetAllUsersStreamExcludingBlocked({required this.users});
}

class GetBlockedUsers extends ChatEvents{
  final String userId;
  GetBlockedUsers({required this.userId});
}

class SendMessage extends ChatEvents {
  final String receiverID;
  final String message;
  SendMessage({required this.receiverID, required this.message});
}

class GetMessage extends ChatEvents {
  final String currentUserID;
  final String recipientsUserID;
  GetMessage({required this.currentUserID, required this.recipientsUserID});
}

class ReportUser extends ChatEvents{
  final String userID;
  final String messageID;
  ReportUser({required this.userID,
    required this.messageID});

}

class BlockUser extends ChatEvents{
  final String userID;
  BlockUser({required this.userID,
    });
}

class UnblockUser extends ChatEvents {
  final String userID;

  UnblockUser({required this.userID,
  });
}