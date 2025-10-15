import 'package:chit_chat/core/components/my_textfield.dart';
import 'package:chit_chat/features/auth/data/auth_service.dart';
import 'package:chit_chat/features/chat/data/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;
  ChatPage({super.key, required this.receiverEmail, required this.receiverID});

  final TextEditingController _messageController = TextEditingController();

  // chats & auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  //send message
  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          receiverID, _messageController.text.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEmail),
      ),
      body: Column(
        children: [
          Expanded(child: _buildMessageList()),
          _buildUserInput()
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: _chatService.getMessage(receiverID, senderID),
        builder: (context, snapshot) {
          //errors
          if (snapshot.hasError) {
            return const Text("Error");
          }

          //loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          // return list view

          return Text("loaded");
          // return ListView(
          //   children: snapshot.data!.docs
          //       .map((doc) => _buildMessageItem(doc))
          //       .toList(),
          // );
        });
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return Text(data.values.toString());
  }

  Widget _buildUserInput() {
    return Row(
      children: [
        Expanded(
            child: MyTextfield(
                hintText: "Type a message",
                isObscured: false,
                textEditingController: _messageController)
        ),
        IconButton(onPressed: (){
          sendMessage();
        }, icon: Icon(Icons.send))
      ],
    );
  }
}
