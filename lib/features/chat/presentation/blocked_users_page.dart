import 'package:chit_chat/features/auth/data/auth_service.dart';
import 'package:chit_chat/features/chat/presentation/block_users_bloc/block_users_bloc.dart';
import 'package:chit_chat/features/chat/presentation/block_users_bloc/block_users_event.dart';
import 'package:chit_chat/features/chat/presentation/block_users_bloc/block_users_state.dart';
import 'package:chit_chat/features/chat/presentation/chat_ui_components/user_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat_bloc/chat_bloc.dart';

class BlockedUsersPage extends StatefulWidget {
   BlockedUsersPage({super.key});

  @override
  State<BlockedUsersPage> createState() => _BlockedUsersPageState();
}

class _BlockedUsersPageState extends State<BlockedUsersPage> {
  //chat and auth services
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
               context.read<BlockUsersBloc>().add(UnBlockUser(userToBeUnBlockedId: userId));
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
  void initState() {
  context.read<BlockUsersBloc>().add(LoadBlockedUsers(forUserId: _authService.getCurrentUser()!.uid));
    super.initState();
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
      body: BlocBuilder<BlockUsersBloc, BlockUsersState>(builder: (context, state){
        if(state is Loading){
          return Center(child: CircularProgressIndicator(),);

        }else if (state is Loaded){
          if(state.blockedUsers.isEmpty){
            return Center(child: Text("No blocked user"),);

          } else{
            return ListView.builder(
                itemCount: state.blockedUsers.length,
                itemBuilder: (context, index){
                  final user = state.blockedUsers[index];
                  return UserTile(
                    userName: user["email"],
                    onTap: () => _showUnblockDialog(context, user['uid']), isOnline: user["isOnline"], otherUserId: user['uid'],);
                });

          }
        }

        return Center(child: Text("An Error occured"),);

      })
    );
  }
}
