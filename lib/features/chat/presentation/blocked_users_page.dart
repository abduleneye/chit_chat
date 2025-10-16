import 'package:chit_chat/core/components/my_app_bar.dart';
import 'package:chit_chat/features/auth/data/auth_service.dart';
import 'package:chit_chat/features/chat/data/chat_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlockedUsersPage extends StatelessWidget {
   BlockedUsersPage({super.key});

  //chat and auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final _currentUser = _authService.getCurrentUser()!.uid;
    return Scaffold(
      appBar: AppBar(
        title: Text("BLOCKED USERS"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      // body: StreamBuilder<List<Map<String, dynamic>>>(
      //     stream: _chatService.getBlockedUsers(_currentUser),
      //     builder: (context, snapshot){
      //       //errors
      //     }
      // ),

    );
  }
}
