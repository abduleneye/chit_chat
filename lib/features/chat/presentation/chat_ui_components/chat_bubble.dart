import 'package:chit_chat/core/home_page.dart';
import 'package:chit_chat/core/themes/theme_provider.dart';
import 'package:chit_chat/features/chat/data/chat_service.dart';
import 'package:chit_chat/features/chat/presentation/block_users_bloc/block_users_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../block_users_bloc/block_users_bloc.dart';

class ChatBubble extends StatelessWidget {
  final String? loggedInUser;
  final String message;
  final bool isCurrentUser;
  final String messageId;
  final String userId;
  const ChatBubble(
      {super.key,
      required this.message,
      required this.isCurrentUser,
      required this.messageId,
      required this.userId,
      this.loggedInUser});
  //show options
  void _showOptions(BuildContext context, String messageId, String userId) {
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
                      context.read<BlockUsersBloc>().add(BlockUser(userToBeBlockedId: userId));
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

  @override
  Widget build(BuildContext context) {
    //light vs darkmode for correct bubble color
    bool isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    return GestureDetector(
      onLongPress: () {
        if (!isCurrentUser) {
          //show options
          _showOptions(context, messageId, userId);
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: isCurrentUser
                ? (isDarkMode ? Colors.green.shade600 : Colors.grey.shade500)
                : (isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200),
            borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        child: Text(
          message,
          style: TextStyle(
              color: isCurrentUser
                  ? Colors.white
                  : (isDarkMode ? Colors.white : Colors.black)),
        ),
      ),
    );
  }
}
