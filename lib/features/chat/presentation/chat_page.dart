import 'package:chit_chat/core/components/my_textfield.dart';
import 'package:chit_chat/features/auth/data/auth_service.dart';
import 'package:chit_chat/features/chat/data/chat_service.dart';
import 'package:chit_chat/features/chat/presentation/chat_bloc/chat_bloc.dart';
import 'package:chit_chat/features/chat/presentation/chat_bloc/chat_events.dart';
import 'package:chit_chat/features/chat/presentation/chat_bloc/chat_states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'chat_ui_components/chat_bubble.dart';


class ChatPage extends StatefulWidget {
  final String receiverEmail;
  final String receiverID;
  ChatPage({super.key, required this.receiverEmail, required this.receiverID});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();

  // chats & auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  // for text field focus
  FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    context.read<ChatBloc>().add(GetMessage(currentUserID: _authService.getCurrentUser()!.uid, recipientsUserID: widget.receiverID));

    //add listener to focus node
    myFocusNode.addListener((){
      if(myFocusNode.hasFocus){
        //cause a delay that the keyboard has time to show up
        //then the ammount of remaining space is calculated
        //then scroll down
        Future.delayed(
          const Duration(milliseconds: 500), ()=> scrollDown(),
        );
      }
    });
    // auto scroll on page entered
    Future.delayed(
      const Duration(milliseconds: 500), ()=> scrollDown(),
    );
    super.initState();

  }

  @override
  void dispose() {
    myFocusNode.dispose();
    _messageController.dispose();
    super.dispose();
  }

  //scroll controller
  final ScrollController _scrollController = ScrollController();
  void scrollDown(){
    _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn);
  }

  //send message
  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      // await _chatService.sendMessage(
      //     widget.receiverID, _messageController.text.toString());

      context.read<ChatBloc>().add(SendMessage(receiverID: widget.receiverID, message: _messageController.text.toString()));

      _messageController.clear();
      scrollDown();
      //print(_authService.getCurrentUser()!.uid + _authService.getCurrentUser()!.email.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverEmail),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      body: Column(
        children: [Expanded(child: _buildMessageList()), _buildUserInput()],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return BlocBuilder<ChatBloc, ChatStates>(builder: (context, chatState){
      if(chatState is MessagesLoaded){
        return ListView(
          controller: _scrollController,
          children: chatState.messages.docs
              .map((doc) => _buildMessageItem(doc))
              .toList(),
        );
      }
      else if(chatState is LoadingMessages){
        return Center(
          child: Text("Messages Loading"),
        );
      }

      return Center(
        child: Text("Wahala"),
      );
    });
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // is current user
    bool isCurrentUser = data['senderID'] == _authService.getCurrentUser()!.uid;
    // align message to the right if sender is current user
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
    return Container(
      alignment: alignment,
     // color: Colors.purple,
      child: Column(
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          ChatBubble(
            message: data["message"],
            isCurrentUser: isCurrentUser,
            messageId: doc.id,
            userId: data["senderID"],
          )
        ],
      ),
    );
  }

  Widget _buildUserInput() {
    return Padding(
      padding: EdgeInsets.only(bottom: 25.0),
      child: Row(
        children: [
          Expanded(
              child: MyTextfield(
                  hintText: "Type a message",
                  isObscured: false,
                  textEditingController: _messageController,
                  focusNode: myFocusNode,
              )
          ),
          Container(
            margin: EdgeInsets.only(right: 25),
            decoration:
                BoxDecoration(color: Colors.green, shape: BoxShape.circle),
            child: IconButton(
                onPressed: () {
                  sendMessage();
                },
                icon: Icon(
                  Icons.send,
                  color: Colors.white,
                )),
          )

          // Padding(
          //   padding: EdgeInsets.only(right: 25),
          //   child:  Container(
          //   decoration: BoxDecoration(
          //       color: Colors.green,
          //       shape: BoxShape.circle
          //   ),
          //   child: IconButton(onPressed: (){
          //     sendMessage();
          //   }, icon: Icon(Icons.send)),
          // ),)
        ],
      ),
    );
  }
}
