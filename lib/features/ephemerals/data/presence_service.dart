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
}
