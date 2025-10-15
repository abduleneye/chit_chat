import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";

import "../domain/models/message.dart";

class ChatService{
  //get instance of cloud fire store
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  //get user stream

  /*
  * List<<Map<String, dynamic>>> = 

  * [
  * {
  * 'email': test@gmail,
  * 'id': 1
  * },
  * {
  * 'email': eneye@gmail,
  * 'id': 2
  * },
  * ]
  *
  * */
Stream<List<Map<String, dynamic>>> getUsersStream(){
  return _firestore.collection("Users").snapshots().map((snapshots){
    return snapshots.docs.map((doc){
      // go through each individual user
      final user = doc.data();

      // return user
      return user;
    }).toList();
  });

}

  // send message
Future<void> sendMessage(String receiverID, message) async{
  // get current user info
  final String currentUserID = _auth.currentUser!.uid;
  final String? currentUserEmail = _auth.currentUser!.email;
  final Timestamp timestamp =  Timestamp.now();

  //create a new message
  Message newMessage = Message(
      timestamp: timestamp,
      message: message,
      receiverID: receiverID,
      senderEmail: currentUserEmail,
      senderID: currentUserID);

  // construct chat room ID for the two users (sorted to ensure uniqueness) to store messages
  List<String> ids = [currentUserID, receiverID];
  ids.sort(); // sort the ids (this ensure the chatroomID is the same for any 2 people)
  String chatRoomID = ids.join('_');
   //add new message to database
  await _firestore
  .collection("chat_rooms")
  .doc(chatRoomID)
  .collection("messages")
  .add(newMessage.toMap());

}


  // get message
Stream<QuerySnapshot> getMessage(String userID, otherUserId){
  //construct chat room ID for the two users
  List<String> ids = [userID, otherUserId];
  ids.sort();
  String chatRoomID = ids.join('_');
  return _firestore
      .collection("chat_rooms")
      .doc(chatRoomID)
      .collection("messages")
      .orderBy("timeStamp", descending: false)
      .snapshots();

}
}