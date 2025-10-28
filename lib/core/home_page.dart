import 'package:chit_chat/features/auth/data/auth_service.dart';
import 'package:chit_chat/features/chat/data/chat_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../features/chat/presentation/chat_page.dart';
import '../features/chat/presentation/chat_ui_components/user_tile.dart';
import 'components/my_drawer.dart';


class HomePage extends StatelessWidget {
   HomePage({super.key});

  //chat and auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,

      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }
  Widget _buildUserList(){
    return StreamBuilder(
        stream: _chatService.getUsersStreamExcludingBlocked(),
        builder: (context, snapshot){
          //error
          if(snapshot.hasError){
            return Text("error");

          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: Text("Loading..."),
            );
          }
        //  return Text("loaded");


          //return list view
         return   ListView(
              children:
              snapshot.data!.map<Widget>((userData) => _buildUserListItem(
                  userData, context
              )).toList()
          );
        }
    );
  }

  //

   //build individual list tile for user
  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context){
    //display all users except current user


      if( _authService.getCurrentUser() != null && userData["email"] != _authService.getCurrentUser()!.email){
        return UserTile(
          userName: userData["email"],
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage(receiverEmail: userData["email"], receiverID: userData["uid"],)));
          },
        );
      }

   else{
     return Container();
   }



  }

}
 