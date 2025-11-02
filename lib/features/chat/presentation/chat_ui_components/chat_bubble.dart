import 'package:chit_chat/core/components/my_textfield.dart';
import 'package:chit_chat/core/home_page.dart';
import 'package:chit_chat/core/themes/theme_provider.dart';
import 'package:chit_chat/features/chat/data/chat_service.dart';
import 'package:chit_chat/features/chat/presentation/block_users_bloc/block_users_event.dart';
import 'package:chit_chat/features/chat/presentation/chat_bloc/chat_bloc.dart';
import 'package:chit_chat/features/chat/presentation/chat_bloc/chat_events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../block_users_bloc/block_users_bloc.dart';

class ChatBubble extends StatefulWidget {
  //final String? loggedInUser;
  final String message;
  final bool isCurrentUser;
  final String messageId;
  final String userId;
  final String receiverId;
  final String timeStamp;
  final bool messageDeleted;
  final bool messageEdited;
  const ChatBubble({
    super.key,
    // this.loggedInUser,
    required this.messageEdited,
    required this.messageDeleted,
    required this.message,
    required this.isCurrentUser,
    required this.messageId,
    required this.userId,
    required this.receiverId,
    required this.timeStamp,
  });

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  late TextEditingController _textEditingController;
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();

    _textEditingController = TextEditingController(text: widget.message);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: 1000), () {
        _focusNode.requestFocus();
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  //show security options
  void _showChatSecurityOptions(
      BuildContext context, String messageId, String userId) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SafeArea(
              child: Wrap(
            children: [
              // report message button
              ListTile(
                leading: Icon(Icons.flag),
                title: Text("Report"),
                onTap: () {
                  Navigator.pop(context);
                  _reportMessage(context, messageId, userId);
                },
              ),
              // block user button
              ListTile(
                leading: Icon(Icons.block),
                title: Text("Block"),
                onTap: () {
                  _blockUser(context, userId);
                },
              ),
              // cancel button
              ListTile(
                leading: Icon(Icons.cancel),
                title: Text("Cancel"),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ));
        });
  }

  //show chat modification options
  void _showChatModificationOptions(
      BuildContext context, String messageId, String receiverId) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SafeArea(
              child: Wrap(
            children: [
              // delete message button
              ListTile(
                leading: Icon(Icons.edit),
                title: Text("Edit"),
                onTap: () {
                  Navigator.pop(context);
                  _editMessage(context, receiverId, messageId);
                },
              ),
              // block user button
              ListTile(
                leading: Icon(Icons.delete),
                title: Text("Delete"),
                onTap: () {
                  _deleteMessage(context, receiverId, messageId);
                },
              ),
              // cancel button
              ListTile(
                leading: Icon(Icons.cancel),
                title: Text("Cancel"),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ));
        });
  }

  //report message
  void _reportMessage(BuildContext context, String messageId, String userId) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Report message"),
              content: Text("Are you sure you want to report this message?"),
              actions: [
                //cancel button
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel")),
                //report button
                TextButton(
                    onPressed: () {
                      ChatService().reportUser(messageId, userId);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Message Reported")));
                    },
                    child: Text("Report"))
              ],
            ));
  }

  //block user
  void _blockUser(BuildContext context, String userId) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Block User"),
              content: Text("Are you sure you want to block this user?"),
              actions: [
                //cancel button
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel")),
                //block button
                TextButton(
                    onPressed: () {
                      //block user invoked
                      context
                          .read<BlockUsersBloc>()
                          .add(BlockUser(userToBeBlockedId: userId));

                      //close block user dialog
                      Navigator.pop(context);
                      //close block user chat page
                      Navigator.pop(context);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => HomePage(
                      //               currentUser: loggedInUser,
                      //             )));

                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("User Blocked!")));
                    },
                    child: Text("Block"))
              ],
            ));
  }

  void _editMessage(BuildContext context, String receiverId, String messageId) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.edit),
                  title: Text("Edit Message"),
                  titleTextStyle: TextStyle(fontSize: 24, color: Colors.black),
                  onTap: () {},
                ),
                // delete message button
                Text("Are you sure you want to edit this message?"),
                SizedBox(
                  height: 20,
                ),

                MyTextfield(
                    //focusNode: _focusNode,
                    makeAutoFocus: true,
                    hintText: "",
                    isObscured: false,
                    textEditingController: _textEditingController),
                SizedBox(
                  height: 100,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel")),
                    TextButton(
                        onPressed: () {
                          context.read<ChatBloc>().add(EditMessage(
                              receiverId: receiverId,
                              messageId: messageId,
                              newMessage: _textEditingController.text));
                          Navigator.pop(context);
                        },
                        child: Text("Done"))
                  ],
                )
                // block user button

                // cancel button
              ],
            ),
          );
        });
    // showDialog(
    //     context: context,
    //     builder: (context) => AlertDialog(
    //           title: Text("Edit Message"),
    //           content: Column(
    //             children: [
    //               Text("Are you sure you want to edit this message?"),
    //               TextField(
    //                 controller: _textEditingController,
    //               )
    //             ],
    //           ),
    //           actions: [
    //             //cancel button
    //             TextButton(
    //                 onPressed: () {
    //                   Navigator.pop(context);
    //                 },
    //                 child: Text("Cancel")),
    //             //block button
    //             TextButton(
    //                 onPressed: () {
    //                   //block user invoked
    //                   context.read<ChatBloc>().add(EditMessage(
    //                       receiverId: receiverId,
    //                       messageId: messageId,
    //                       newMessage: _textEditingController.text));
    //
    //                   //close block user dialog
    //                   Navigator.pop(context);
    //                   //close block user chat page
    //                  // Navigator.pop(context);
    //                   // Navigator.push(
    //                   //     context,
    //                   //     MaterialPageRoute(
    //                   //         builder: (context) => HomePage(
    //                   //               currentUser: loggedInUser,
    //                   //             )));
    //
    //                   ScaffoldMessenger.of(context).showSnackBar(
    //                       SnackBar(content: Text("Message Deleted")));
    //                 },
    //                 child: Text("Done"))
    //           ],
    //         ));
  }

  void _deleteMessage(
      BuildContext context, String receiverId, String messageId) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Delete Message"),
              content: Text("Are you sure you want to delete this message?"),
              actions: [
                //cancel button
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel")),
                //block button
                TextButton(
                    onPressed: () {
                      //block user invoked
                      context.read<ChatBloc>().add(DeleteMessage(
                          receiverId: receiverId, messageId: messageId));

                      //close block user dialog
                      Navigator.pop(context);
                      //close block user chat page
                      Navigator.pop(context);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => HomePage(
                      //               currentUser: loggedInUser,
                      //             )));

                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Message Deleted")));
                    },
                    child: Text("Delete"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    //light vs darkmode for correct bubble color
    bool isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    return GestureDetector(
      onLongPress: () {
        if (!widget.isCurrentUser) {
          //show options
          _showChatSecurityOptions(context, widget.messageId, widget.userId);
        }
        if (widget.isCurrentUser) {
          if(!widget.messageDeleted){
            //show options
            _showChatModificationOptions(
                context, widget.messageId, widget.receiverId);
          }

        }
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.4,
        decoration: BoxDecoration(
            color: widget.isCurrentUser
                ? (isDarkMode ? Colors.green.shade600 : Colors.grey.shade500)
                : (isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200),
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(12),
                topRight: const Radius.circular(12),
                bottomLeft: widget.isCurrentUser
                    ? const Radius.circular(12)
                    : const Radius.circular(0),
                bottomRight: widget.isCurrentUser
                    ? Radius.circular(0)
                    : Radius.circular(12))),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              // textAlign: TextAlign.start,
              widget.messageDeleted && widget.isCurrentUser
                  ? "You deleted this message"
                  : widget.messageDeleted && !widget.isCurrentUser
                      ? "Message Deleted"
                      : widget.message,
              style: TextStyle(
                  color: widget.isCurrentUser
                      ? Colors.white
                      : (isDarkMode ? Colors.white : Colors.black)),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.messageEdited ? "Edited" : widget.messageDeleted ? " " : " ",
                  style: TextStyle(fontSize: 12, color: Color(0xFF344433)),
                ),
                Text(
                  widget.timeStamp,
                  style: TextStyle(fontSize: 12, color: Color(0xFF344433)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
