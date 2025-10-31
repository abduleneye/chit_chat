import 'package:chit_chat/features/auth/data/auth_service.dart';
import 'package:chit_chat/features/chat/data/chat_service.dart';
import 'package:chit_chat/features/chat/presentation/chat_bloc/chat_bloc.dart';
import 'package:chit_chat/features/chat/presentation/chat_bloc/chat_states.dart';
import 'package:chit_chat/features/chat/presentation/users_bloc/users_bloc.dart';
import 'package:chit_chat/features/chat/presentation/users_bloc/users_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/chat/presentation/chat_page.dart';
import '../features/chat/presentation/chat_ui_components/user_tile.dart';
import '../features/chat/presentation/users_bloc/users_event.dart';
import 'components/my_drawer.dart';

class HomePage extends StatefulWidget {
  final String? currentUser;
  final ChatService chatService;
  HomePage({super.key, required this.currentUser, required this.chatService});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //chat and auth services

  @override
  void initState() {
    context.read<UsersBloc>().add(GetAllUsersStreamExcludingBlocked());
    super.initState();
  }

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

  Widget _buildUserList() {
    return BlocBuilder<UsersBloc, UsersStates>(
      builder: (context, userStates) {
        if (userStates is UsersLoaded) {
          if (userStates.users.isNotEmpty) {
            return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 0),
                itemCount: userStates.users.length,
                itemBuilder: (context, index) {
                  return UserTile(
                    userName: userStates.users[index]["email"],
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlocProvider(create: (_)=> ChatBloc(
                                widget.chatService
                              ),
                                child: ChatPage(
                                  receiverEmail: userStates.users[index]
                                  ["email"],
                                  receiverID: userStates.users[index]["uid"],
                                ),

                              )
                          ));
                    },
                  );
                });
          } else {
            return Center(
              child: Text("No users found"),
            );
          }
        } else if (userStates is LoadingUsers) {
          return Center(
            child: Text("Loading user...."),
          );
        }
        return Center(
          child: Text("unknown error"),
        );
      },
    );
  }
}

// import 'package:chit_chat/features/auth/data/auth_service.dart';
// import 'package:chit_chat/features/chat/data/chat_service.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../features/chat/presentation/chat_page.dart';
// import '../features/chat/presentation/chat_ui_components/user_tile.dart';
// import 'components/my_drawer.dart';
//
//
// class HomePage extends StatelessWidget {
//    HomePage({super.key});
//
//   //chat and auth services
//   final ChatService _chatService = ChatService();
//   final AuthService _authService = AuthService();
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home"),
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.grey,
//         elevation: 0,
//
//       ),
//       drawer: const MyDrawer(),
//       body: _buildUserList(),
//     );
//   }
//   Widget _buildUserList(){
//     return StreamBuilder(
//         stream: _chatService.getAllUsersExcludingBlocked(),
//         builder: (context, snapshot){
//           //error
//           if(snapshot.hasError){
//             return Text("error");
//
//           }
//           if(snapshot.connectionState == ConnectionState.waiting){
//             return const Center(
//               child: Text("Loading..."),
//             );
//           }
//         //  return Text("loaded");
//
//
//           //return list view
//          return   ListView(
//               children:
//               snapshot.data!.map<Widget>((userData) => _buildUserListItem(
//                   userData, context
//               )).toList()
//           );
//         }
//     );
//   }
//
//   //
//
//    //build individual list tile for user
//   Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context){
//     //display all users except current user
//
//
//       if( _authService.getCurrentUser() != null && userData["email"] != _authService.getCurrentUser()!.email){
//         return UserTile(
//           userName: userData["email"],
//           onTap: (){
//             Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage(receiverEmail: userData["email"], receiverID: userData["uid"],)));
//           },
//         );
//       }
//
//    else{
//      return Container();
//    }
//
//
//
//   }
//
// }
//
