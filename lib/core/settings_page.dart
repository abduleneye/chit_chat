import 'package:chit_chat/core/themes/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../features/chat/data/chat_service.dart';
import '../features/chat/presentation/blocked_users_page.dart';
import '../features/chat/presentation/chat_bloc/chat_bloc.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: Text("Settings"),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.grey,
          elevation: 0,
        ),
        body: Center(
          child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 600
              ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //Dark theme container
                Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12)),
                    margin: EdgeInsets.all(25),
                    padding: EdgeInsets.all(16),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Dark Mode"),
                          CupertinoSwitch(
                            value: Provider.of<ThemeProvider>(context, listen: false)
                                .isDarkMode,
                            onChanged: (value) {
                              Provider.of<ThemeProvider>(context, listen: false)
                                  .toggleTheme();
                              //true
                            },
                          )
                        ])),
                //Blocked user container
                Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12)),
                    margin: EdgeInsets.all(25),
                    padding: EdgeInsets.all(16),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Blocked Users"),
                          IconButton(onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>BlockedUsersPage()
                                )
                            );
                          },
                              icon: Icon(Icons.arrow_forward),
                            color: Theme.of(context).colorScheme.primary,
                          )

                        ]))
              ],
            ),
          ),
        ));
  }
}
