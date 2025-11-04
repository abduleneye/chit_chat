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
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../auth/presentation/auth_bloc/auth_bloc.dart';
import '../../auth/presentation/auth_bloc/auth_state.dart';
import '../../ephemerals/data/presence_service.dart';
import 'chat_ui_components/chat_bubble.dart';

class ChatPage extends StatefulWidget {
  // final bool isOnline;
  // final bool isTyping;
  final String receiverEmail;
  final String receiverID;
  const ChatPage(
      {super.key,
      required this.receiverEmail,
      required this.receiverID,
      // required this.isOnline,
      // required this.isTyping
      });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final PresenceService presenceService = PresenceService();

  // chats & auth services

  final AuthService _authService = AuthService();


  // for text field focus
  FocusNode myFocusNode = FocusNode();
  @override
  void initState() {
    //
    // context.read<ChatBloc>().add(GetMessage(
    //     currentUserID: _authService.getCurrentUser()!.uid,
    //     recipientsUserID: widget.receiverID));

    final authState = context.read<AuthBloc>().state;

    if (authState is UserAuthenticated) {
      final currentUserId = authState.currentUser?.uid;

      context.read<ChatBloc>().add(
            GetMessage(
              currentUserID: currentUserId!,
              recipientsUserID: widget.receiverID,
            ),
          );
    }

    //add listener to focus node
    myFocusNode.addListener(() {
      if (myFocusNode.hasFocus) {
        //cause a delay that the keyboard has time to show up
        //then the ammount of remaining space is calculated
        //then scroll down
        Future.delayed(
          const Duration(milliseconds: 500),
          () => scrollDown(),
        );
      }
    });
    // auto scroll on page entered
    Future.delayed(
      const Duration(milliseconds: 500),
      () => scrollDown(),
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
  void scrollDown() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

  //send message
  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      // await _chatService.sendMessage(
      //     widget.receiverID, _messageController.text.toString());

      context.read<ChatBloc>().add(SendMessage(
          receiverID: widget.receiverID,
          message: _messageController.text.toString()));

      _messageController.clear();
      scrollDown();
      //print(_authService.getCurrentUser()!.uid + _authService.getCurrentUser()!.email.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.receiverEmail, style: TextStyle(fontSize: 18)),
            StreamBuilder(
              stream: PresenceService().getUserStatus(widget.receiverID),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Text(
                    "Offline",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.red
                  ),
                );

                final data = snapshot.data!;
                final isOnline = data["isOnline"] ?? false;

                if (isOnline) {
                  return const Text("Online",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.green
                      ));
                } else {

                  final lastSeen = DateTime.fromMillisecondsSinceEpoch(data["lastSeen"]);
                  final formatted = DateFormat('EEEE HH:mm').format(lastSeen.toLocal());

                  return Text(
                    "Last seen on:  $formatted",
                    style: TextStyle(
                        fontSize: 12,
                      color: Colors.black
                    ),
                  );

                }
              },
            ),
            StreamBuilder<bool>(
              stream: presenceService.listenToTyping(_authService.getCurrentUser()!.uid, widget.receiverID),
              builder: (context, snapshot) {
                final isTyping = snapshot.data ?? false;
                if (isTyping) {
                  return  SizedBox(
                    height: 12,
                    child: Text(
                      "Typing...",
                      style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey, fontSize: 10),
                    ),
                  );
                } else {
                  return const SizedBox(
                    height: 12,
                    child: Text(
                      "",
                      style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey, fontSize: 10),
                    ),
                  );
                }
              },
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(child: _buildMessageList()),
          SizedBox(
            height: 3,
          ),
          _buildUserInput()
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return BlocBuilder<ChatBloc, ChatStates>(builder: (context, chatState) {
      if (chatState is MessagesLoaded) {
        //_buildMessageItem(doc)
        return ListView.builder(
            controller: _scrollController,
            shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 0),
            itemCount: chatState.messages.length,
            itemBuilder: (context, index) {
              return _buildMessageItem(
                  messages: chatState.messages, index: index);
            });
      } else if (chatState is LoadingMessages) {
        return Center(
          child: Text("Messages Loading"),
        );
      }

      return Center(
        child: Text("Wahala"),
      );
    });
  }

  Widget _buildMessageItem(
      {required List<Map<String, dynamic>> messages, required int index}) {
    // Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // is current user
    bool isCurrentUser =
        messages[index]['senderID'] == _authService.getCurrentUser()!.uid;
    // align message to the right if sender is current user
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    Timestamp timestamp = messages[index]["timeStamp"];
    DateTime dateTime = timestamp.toDate();
    String formattedTime = DateFormat('h:mma').format(dateTime);
    return Container(
      alignment: alignment,
      // color: Colors.purple,
      child: Column(
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          ChatBubble(
              message: messages[index]["message"],
              isCurrentUser: isCurrentUser,
              messageId: messages[index]['messageId'],
              userId: messages[index]["senderID"],
              timeStamp: formattedTime,
              receiverId: messages[index]["receiverID"],
              messageDeleted: messages[index]["messageDeleted"],
              messageEdited: messages[index]["messageEdited"])
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
                onChanged: (value){
                  presenceService.handleTyping(_authService.getCurrentUser()!.uid, widget.receiverID);
                },
            hintText: "Type a message",
            isObscured: false,
            textEditingController: _messageController,
            focusNode: myFocusNode,
          )),
          Container(
            margin: EdgeInsets.only(right: 25),
            decoration:
                BoxDecoration(color: Colors.green, shape: BoxShape.circle),
            child: IconButton(
                onPressed: () {
                  sendMessage();
                  FocusScope.of(context).unfocus();
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
