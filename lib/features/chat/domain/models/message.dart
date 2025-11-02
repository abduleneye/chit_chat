import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
  final String senderId;
  final String? senderEmail;
  final String receiverID;
  final String message;
  final bool messageDeleted;
  final bool messageEdited;
  final Timestamp timestamp;

  Message(
  {
    required this.messageDeleted,
    required this.messageEdited,
    required this.timestamp,
    required this.message,
    required this.receiverID,
    required this.senderEmail,
    required this.senderId

}
);

  // convert to map
Map<String, dynamic> toMap(){
  return{
    'senderID': senderId,
    'senderEmail': senderEmail,
    'receiverID': receiverID,
    'message': message,
    'messageDeleted': messageDeleted,
    'messageEdited': messageEdited,
    'timeStamp': timestamp
  };
}
}