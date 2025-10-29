import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ChatServiceRepository{

  Stream<QuerySnapshot> getMessage(String userID, receipientUserId);
  Stream<List<Map<String, dynamic>>> getAllUsersStream();
  Stream<List<Map<String, dynamic>>> getAllUsersExcludingBlocked();
  Stream<List<Map<String, dynamic>>> getAllBlockedUsers(String currentUserId);
  Future<void> sendMessage(String currentUserId, String recepientUserId);
  Future<void> reportUser(String messageId, String userId);
  Future<void> blockUser(String userId);
  Future<void> unBlockUser(String blockedUserId);

}