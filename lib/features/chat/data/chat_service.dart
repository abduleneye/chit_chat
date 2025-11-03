import "package:chit_chat/features/chat/domain/chat_repos/chat_service_repository.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:fluttertoast/fluttertoast.dart";
import 'package:rxdart/rxdart.dart';
import "package:flutter/cupertino.dart";

import "../domain/models/message.dart";

class ChatService implements ChatServiceRepository {
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

  // Future<void> sendMessage(String receiverID, message) async {
  //   // get current user info
  //   final String currentUserID = _auth.currentUser!.uid;
  //   final String? currentUserEmail = _auth.currentUser!.email;
  //   final Timestamp timestamp = Timestamp.now();
  //
  //   //create a new message
  //   Message newMessage = Message(
  //       timestamp: timestamp,
  //       message: message,
  //       receiverID: receiverID,
  //       senderEmail: currentUserEmail,
  //       senderId: currentUserID);
  //
  //   // construct chat room ID for the two users (sorted to ensure uniqueness) to store messages
  //   List<String> ids = [currentUserID, receiverID];
  //   ids.sort(); // sort the ids (this ensure the chatroomID is the same for any 2 people)
  //   String chatRoomID = ids.join('_');
  //   //add new message to database
  //   await _firestore
  //       .collection("chat_rooms")
  //       .doc(chatRoomID)
  //       .collection("messages")
  //       .add(newMessage.toMap());
  // }

//UNBLOCK USER
  @override
  Future<void> unBlockUser(String blockedUserId) async {
    final currentUser = _auth.currentUser;
    await _firestore
        .collection('Users')
        .doc(currentUser!.uid)
        .collection('BlockedUsers')
        .doc(blockedUserId)
        .delete();
  }

  //BLOCK USER
  @override
  Future<void> blockUser(String userId) async {
    final currentUser = _auth.currentUser;
    await _firestore
        .collection("Users")
        .doc(currentUser!.uid)
        .collection('BlockedUsers')
        .doc(userId)
        .set({});
  }

  @override
  Future<void> sendMessage(String receiverId, message) async {
    // get current user info
    final String currentUserId = _auth.currentUser!.uid;
    final String? currentUserEmail = _auth.currentUser!.email;
    final Timestamp timestamp = Timestamp.now();
    final bool messageEdited = false;
    final bool messageDeleted = false;

    //create a new message
    Message newMessage = Message(
        timestamp: timestamp,
        message: message,
        receiverID: receiverId,
        senderEmail: currentUserEmail,
        senderId: currentUserId,
        messageDeleted: messageEdited,
        messageEdited: false);

    // construct chat room ID for the two users (sorted to ensure uniqueness) to store messages
    List<String> ids = [currentUserId, receiverId];
    ids.sort(); // sort ensures the ids (this ensure the chatroomID is the same for any 2 people)
    String chatRoomId = ids.join("_");
    //add new message to database
    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .add(newMessage.toMap());
  }

//REPORT USER
  @override
  Future<void> reportUser(String messageId, String userId) async {
    final currentUser = _auth.currentUser;
    final report = {
      'reportedBy': currentUser!.uid,
      'messageId': messageId,
      'messageOwnerId': userId,
      'timeStamp': FieldValue.serverTimestamp()
    };

    await _firestore.collection('Reports').add(report);
  }

  // GET MESSAGE
  @override
  Stream<List<Map<String, dynamic>>> getMessage(String userId, otherUserId) {
    //construct chat room ID for the two users
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");
    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("timeStamp", descending: false)
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs.map((doc) {
              final map = doc.data() as Map<String, dynamic>;
              map['messageId'] = doc.id; // attaching the id for future use
              return map;
            }).toList());
  }

//GET BLOCKED USER STREAM
  @override
  Stream<List<Map<String, dynamic>>> getAllBlockedUsers(String currentUserId) {
    return _firestore
        .collection('Users')
        .doc(currentUserId)
        .collection('BlockedUsers')
        .snapshots()
        .asyncMap((snapshot) async {
      // get list of blocked user ids
      final blockedUsersIds = snapshot.docs.map((doc) => doc.id).toList();

      final userDocs = await Future.wait(blockedUsersIds
          .map((id) => _firestore.collection('Users').doc(id).get()));

      return userDocs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    });
  }

  //GET ALL USERS STREAM Excluding blocked
  @override
  Stream<List<Map<String, dynamic>>> getAllUsersStreamExcludingBlocked() {
    final currentUser = _auth.currentUser;
    if (currentUser == null) return Stream.value([]);

    final currentEmail = currentUser.email?.trim().toLowerCase();
    print("✅ Current logged in email: $currentEmail");

    // Stream of blocked user IDs
    final blockedUsersStream = _firestore
        .collection('Users')
        .doc(currentUser.uid)
        .collection('BlockedUsers')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.id).toList());

    // Stream of all users
    final allUsersStream = _firestore.collection('Users').snapshots();

    // Combine streams using Rx.combineLatest2
    return Rx.combineLatest2<List<String>, QuerySnapshot<Map<String, dynamic>>,
        List<Map<String, dynamic>>>(
      blockedUsersStream,
      allUsersStream,
      (blockedIds, allUsersSnapshot) {
        return allUsersSnapshot.docs
            .where((doc) =>
                doc.data()['email'] != currentUser.email &&
                !blockedIds.contains(doc.id))
            .map((doc) => doc.data())
            .toList();
      },
    );
  }

  //GET ALL USERS STREAM
  @override
  Stream<List<Map<String, dynamic>>> getAllUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshots) {
      return snapshots.docs.map((doc) {
        // go through each individual user
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  //GET ALL USERS STREAM Excluding current user
  @override
  Stream<List<Map<String, dynamic>>> getAllUsersStreamExcludingCurrentUser() {
    final currentUser = _auth.currentUser;
    if (currentUser == null) return Stream.value([]);

    final currentEmail = currentUser.email?.trim().toLowerCase();
    print("✅ Current logged in email: $currentEmail");

    return _firestore.collection("Users").snapshots().map((snapshots) {
      for (var doc in snapshots.docs) {
        print(
            "🔥 Firestore email: ${(doc.data()['email'] as String?)?.trim().toLowerCase()}");
      }

      return snapshots.docs
          .where((doc) {
            final userEmail =
                (doc.data()['email'] as String?)?.trim().toLowerCase();
            return userEmail != currentEmail;
          })
          .map((doc) => doc.data())
          .toList();
    });
  }

  // @override
  // Future<void> deleteMessage(String messageId, String receiverId) async {
  //   print("In delete1");
  //
  //   // get current user info
  //   final String currentUserId = _auth.currentUser!.uid;
  //
  //
  //   // construct chat room ID for the two users (sorted to ensure uniqueness) to store messages
  //   List<String> ids = [currentUserId, receiverId];
  //   ids.sort(); // sort ensures the ids (this ensure the chatroomID is the same for any 2 people)
  //   String chatRoomId = ids.join("_");
  //   //add new message to database
  //   try{
  //     print("In delete mess ID${messageId} and rec ID${receiverId}");
  //
  //     await _firestore
  //         .collection("chat_rooms")
  //         .doc(chatRoomId)
  //         .collection("messages")
  //         .doc(messageId)
  //         .delete();
  //
  //   } catch (e) {
  //     print("Firestore delete  error: $e");
  //   }
  //
  // }

  @override
  Future<void> deleteMessage(String messageId, String receiverId) async {
    print("In delete1");

    final String currentUserId = _auth.currentUser!.uid;
    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");

    try {
      print("In delete mess ID: $messageId and rec ID: $receiverId");
      final docRef = _firestore
          .collection("chat_rooms")
          .doc(chatRoomId)
          .collection("messages")
          .doc(messageId);

      final docSnap = await docRef.get();
      if (docSnap.exists) {
        await docRef.update({'messageDeleted': true});
        print("Message deleted successfully ✅");
      } else {
        print("Message not found ❌");
      }
    } catch (e) {
      print("Firestore delete error: $e");
    }
  }

  @override
  Future<void> editMessage(
      String messageId, String receiverId, String newMessage) async {
    print("In delete1");

    final String currentUserId = _auth.currentUser!.uid;
    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");

    try {
      print("In delete mess ID: $messageId and rec ID: $receiverId");
      final docRef = _firestore
          .collection("chat_rooms")
          .doc(chatRoomId)
          .collection("messages")
          .doc(messageId);

      final docSnap = await docRef.get();
      if (docSnap.exists) {
        await docRef.update({'message': newMessage, 'messageEdited': true});
        print("Message deleted successfully ✅");
      } else {
        print("Message not found ❌");
      }
    } catch (e) {
      print("Firestore delete error: $e");
    }
    // .update({'isRead': true})
  }

  @override
  Future<void> updateUserInfo(Map<String, dynamic> userInfo) async {
    print("Update User Info");

    final String currentUserId = _auth.currentUser!.uid;

    try {
      print("In Update User Info mess ID: ${userInfo}");
      final docRef = _firestore
          .collection("Users")
          .doc(currentUserId);

      final docSnap = await docRef.get();
      if (docSnap.exists) {
        await docRef.update(
            userInfo
        );
        print("Details updated successfully ✅");
      } else {
        print("Message not found ❌");
      }
    } catch (e) {
      print("Firestore delete error: $e");
    }
  }
}
