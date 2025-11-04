import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class PresenceService {
  final _auth = FirebaseAuth.instance;
  final _database = FirebaseDatabase.instance;

  DatabaseReference get _connectedRef => _database.ref(".info/connected");

  Future<void> initPresence() async {
    final user = _auth.currentUser;
    if (user == null) return;

    final userStatusRef = _database.ref("status/${user.uid}");

    // Data for online and offline states
    final onlineStatus = {
      "isOnline": true,
      "lastSeen": ServerValue.timestamp,
    };
    final offlineStatus = {
      "isOnline": false,
      "lastSeen": ServerValue.timestamp,
    };

    // Listen to connection state
    _connectedRef.onValue.listen((event) {
      final connected = event.snapshot.value as bool? ?? false;
      if (connected) {
        // When connection is active, set online
        userStatusRef.onDisconnect().set(offlineStatus);
        userStatusRef.set(onlineStatus);
      } else {
        // When connection lost, mark offline immediately
        userStatusRef.set(offlineStatus);
      }
    });
  }

  Stream<Map<String, dynamic>?> getUserStatus(String userId) {
    return _database.ref("status/$userId").onValue.map((event) {
      if (event.snapshot.value == null) return null;
      return Map<String, dynamic>.from(event.snapshot.value as Map);
    });
  }


  final _db = FirebaseDatabase.instance.ref();

  Timer? _typingTimer;


  void setTypingStatus(String currentUserId, String receiverId,  bool isTyping) {
    List<String> ids = [currentUserId, receiverId];
    ids.sort(); // sort ensures the ids (this ensure the chatroomID is the same for any 2 people)
    String chatRoomId = ids.join("_");
    //
    _db.child('TypingStatus')
        .child(chatRoomId)
        .child(currentUserId)
        .set({'isTyping': isTyping});
  }

  void handleTyping(String currentUserId, String receiverId,) {
    // Immediately set isTyping to true when user types
    setTypingStatus(currentUserId,  receiverId, true);

    // Cancel previous timer
    _typingTimer?.cancel();

    // Automatically turn it off after 2 seconds of inactivity
    _typingTimer = Timer(const Duration(seconds: 2), () {
      setTypingStatus(currentUserId, receiverId, false);
    });
  }

  // Stream<bool> listenToTyping(String currentUserId, String receiverId) {
  //   List<String> ids = [currentUserId, receiverId];
  //   ids.sort(); // sort ensures the ids (this ensure the chatroomID is the same for any 2 people)
  //   String chatRoomId = ids.join("_");
  //       _db
  //       .child('TypingStatus')
  //       .child(chatRoomId)
  //       .child(receiverId)
  //       .child('isTyping');
  //
  //   return _db.onValue.map((event) {
  //     print("typing event${event.snapshot.value}");
  //     print("returning ${event.snapshot.value as bool? ?? false}");
  //
  //     return event.snapshot.value as bool? ?? false;
  //   });
  // }
  Stream<bool> listenToTyping(String currentUserId, String receiverId) {
    final ids = [currentUserId, receiverId]..sort();
    final chatRoomId = ids.join("_");

    final ref = _db
        .child('TypingStatus')
        .child(chatRoomId)
        .child(receiverId)
        .child('isTyping');

    return ref.onValue.map((event) {
      print("typing event: ${event.snapshot.value}");
      final isTyping = event.snapshot.value as bool? ?? false;
      print("returning $isTyping");
      return isTyping;
    });
  }


}
