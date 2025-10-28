import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/cupertino.dart";

import "../domain/models/message.dart";

class ChatService extends ChangeNotifier{
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
 //GET ALL USERS STREAM
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
//GET ALL USERS STREAM EXCEPT BLOCKED USERS
  Stream<List<Map<String, dynamic>>> getUsersStreamExcludingBlocked(){
  final currentUser = _auth.currentUser;
  if (currentUser == null) {
    // Return an empty stream if user is not logged in
    return Stream.value([]);
  }
  return _firestore
      .collection('Users')
      .doc(currentUser.uid)
      .collection('BlockedUsers')
      .snapshots()
      .asyncMap((snapshot)async {
    //get blocked user ids
    final blockedUsersids = snapshot.docs.map((doc) => doc.id).toList();

    //get all users
    final userSnapshot = await _firestore.collection('Users').get();

    //return as a stream list
    return userSnapshot.docs
        .where((doc) =>
    doc.data()['email'] != currentUser.email && !blockedUsersids.contains(doc.id))
        .map((doc) => doc.data())
        .toList();
  });

  }


  // SEND MESSAGE
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

  // GET MESSAGE
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

//REPORT USER
Future<void> reportUser(String messageId, String userId) async{
  final currentUser = _auth.currentUser;
  final report = {
    'reportedBy': currentUser!.uid,
    'messageId': messageId,
    'messageOwnerId': userId,
    'timeStamp': FieldValue.serverTimestamp()
  };
  
  await _firestore.collection('Reports').add(report);
}
//BLOCK USER
Future<void> blockUser(String userId) async{
  final currentUser = _auth.currentUser;
  await _firestore
  .collection("Users")
  .doc(currentUser!.uid)
  .collection('BlockedUsers')
  .doc(userId)
  .set({});
  notifyListeners();
}
//UNBLOCK USER
Future<void> unblockUser(String blockUserId) async{
  final currentUser = _auth.currentUser;

  await _firestore
  .collection('Users')
  .doc(currentUser!.uid)
  .collection('BlockedUsers')
  .doc(blockUserId)
  .delete();
}
//GET BLOCKED USER STREAM
Stream<List<Map<String, dynamic>>> getBlockedUsers(String userId){
  return _firestore
      .collection('Users')
      .doc(userId)
      .collection('BlockedUsers')
      .snapshots()
      .asyncMap((snapshot) async{
        //get list of blocked user ids
    final blockedUserIds = snapshot.docs.map((doc) => doc.id).toList();
    
    final userDocs = await Future.wait(
      blockedUserIds
      .map((id)=> _firestore.collection('Users').doc(id).get()),
    );

    //return as list
    return userDocs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  });


}
}