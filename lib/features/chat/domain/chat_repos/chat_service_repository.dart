import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ChatServiceRepository{

  Stream<List<Map<String, dynamic>>> getMessage(String userID, receipientUserId);
  Stream<List<Map<String, dynamic>>> getAllUsersStream(); //For testing
  Stream<List<Map<String, dynamic>>> getAllUsersStreamExcludingCurrentUser(); //For testing
  Stream<List<Map<String, dynamic>>> getAllUsersStreamExcludingBlocked(); //Actually needed
  Stream<List<Map<String, dynamic>>> getAllBlockedUsers(String currentUserId);
  Future<void> sendMessage(String receiverId,  message);
  Future<void> reportUser(String messageId, String userId);
  Future<void> blockUser(String userId);
  Future<void> unBlockUser(String blockedUserId);
  Future<void> editMessage(String messageId, String receiverId, String newMessage);
  Future<void> deleteMessage(String messageId, String receiverId,);


}