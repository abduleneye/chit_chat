import 'package:chit_chat/core/components/my_app_bar.dart';
import 'package:chit_chat/features/auth/data/auth_service.dart';
import 'package:chit_chat/features/chat/data/chat_service.dart';
import 'package:chit_chat/features/chat/presentation/chat_ui_components/user_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlockedUsersPage extends StatelessWidget {
   BlockedUsersPage({super.key});

  //chat and auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();
  //show confirm unblock box
   void _showUnblockDialog(BuildContext context, String userId) {
     showDialog(
         context: context,
         builder: (context) =>AlertDialog(
           title: Text("Unblock User"),
           content: Text("Are you sure you want to block this user?"),
           actions: [
             TextButton(onPressed: (){
               Navigator.pop(context);
             },
                 child: Text("Cancel")
             ),
             TextButton(onPressed: (){
               _chatService.unblockUser(userId);
               Navigator.pop(context);
               ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(content: Text("User Unblocked"))
               );
             },
                 child: Text("Unblock")
             )
           ],

         )
     );
   }


   @override
  Widget build(BuildContext context) {
    String userId = _authService.getCurrentUser()!.uid;
    return Scaffold(
      appBar: AppBar(
        title: Text("BLOCKED USERS"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
          stream: _chatService.getBlockedUsers(userId),
          builder: (context, snapshot){
            //errors
            if(snapshot.hasError){
              return Center(child: Text("An Error occured"),);
            }
            //loading
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }

            final blockedUsers = snapshot.data ?? [];

            //no user
            if(blockedUsers.isEmpty){
              return Center(child: Text("No blocked user"),);
            }
            
            // load complete
            return ListView.builder(
              itemCount: blockedUsers.length,
                itemBuilder: (context, index){
              final user = blockedUsers[index];
              return UserTile(userName: user["email"],
                onTap: () => _showUnblockDialog(context, user['uid']),);
            });
          }
      ),

    );
  }
}
