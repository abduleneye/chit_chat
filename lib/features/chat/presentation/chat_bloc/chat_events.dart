import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ChatEvents {}


class GetBlockedUsers extends ChatEvents{
  final String userId;
  GetBlockedUsers({required this.userId});
}

class SendMessage extends ChatEvents {
  final String receiverID;
  final String message;
  SendMessage({required this.receiverID, required this.message});
}
class EditMessage extends ChatEvents {
  final String receiverId;
  final String messageId;
  final String newMessage;
  EditMessage(  {required this.receiverId, required this.messageId, required this.newMessage,});
}
class DeleteMessage extends ChatEvents {
  final String receiverId;
  final String messageId;
  DeleteMessage({required this.receiverId, required this.messageId});
}

class GetMessage extends ChatEvents {
  final String currentUserID;
  final String recipientsUserID;
  GetMessage({required this.currentUserID, required this.recipientsUserID});
}

class MessageReceived extends ChatEvents {
  final List<Map<String, dynamic>> message;
  MessageReceived({required this.message});
}

class ReportUser extends ChatEvents{
  final String userID;
  final String messageID;
  ReportUser({required this.userID,
    required this.messageID});

}

// class BlockUser extends ChatEvents{
//   final String userID;
//   BlockUser({required this.userID,
//     });
// }

// class UnblockUser extends ChatEvents {
//   final String userID;
//
//   UnblockUser({required this.userID,
//   });
// }