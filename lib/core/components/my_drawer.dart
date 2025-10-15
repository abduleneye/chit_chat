import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/auth/data/auth_service.dart';
import '../../core/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout(){
    //get AuthService
    final _authService = AuthService();
    _authService.signOut();

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Column(
           children: [
             // logo
             DrawerHeader(
               child: Icon(
                 Icons.message,
                 color: Theme.of(context).colorScheme.primary,
                 size: 40,
               ) ,
             ),

             //home list tile
             Padding(
               padding: EdgeInsets.only(left: 25.0),
               child:  ListTile(
                 title: Text("H O M E"),
                 leading: Icon(Icons.home),
                 onTap: (){
                   Navigator.pop(context);
                 },
               ),
             ),

             //setting list tile
             Padding(
               padding: EdgeInsets.only(left: 25.0),
               child:  ListTile(
                 title: Text("S E T T I N G S"),
                 leading: Icon(Icons.settings),
                 onTap: (){
                   Navigator.pop(context);
                   Navigator.push(context, MaterialPageRoute(
                       builder: (context) => SettingsPage()
                   ));
                 },
               ),
             ),

           ],
         ),
          //log out list tile
          Padding(
            padding: EdgeInsets.only(left: 25.0, bottom: 25.0),
            child:  ListTile(
              title: Text("L O G O U T"),
              leading: Icon(Icons.exit_to_app),
              onTap: (){
                logout();
              },
            ),
          ),

        ],
      ),
    );
  }
}
