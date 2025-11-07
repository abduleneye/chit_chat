import 'dart:io';

import 'package:chit_chat/core/home_page.dart';
import 'package:chit_chat/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:chit_chat/features/auth/presentation/auth_bloc/auth_event.dart';
import 'package:chit_chat/features/users_profile/presentation/profile_bloc/profile_bloc.dart';
import 'package:chit_chat/features/users_profile/presentation/profile_bloc/profile_state.dart';
import 'package:chit_chat/features/users_profile/presentation/profile_bloc/proflie_events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../features/auth/data/auth_service.dart';
import '../../core/settings_page.dart';
import '../../features/users_profile/data/user_profile_ops.dart';

class MyDrawer extends StatefulWidget {
  final String currentUserId;
   MyDrawer({super.key, required this.currentUserId});

  @override
  State<MyDrawer> createState() => _MyDrawerState();

}

class _MyDrawerState extends State<MyDrawer> {
  final ImagePicker _picker = ImagePicker();
  final storageRepo = StorageRepository();


  File? file;

  @override
  void initState() {
    context.read<ProfileBloc>().add(GetProfile());
    super.initState();
  }



   // Future<String?> uploadProfileImage(String userId) async {
      @override
  Widget build(BuildContext context) {

        return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // logo
                DrawerHeader(
                  child: Stack(
                    children: [
                     Center(
                       child:  CircleAvatar(
                         radius: 40,
                         child: ClipOval(
                          clipBehavior: Clip.antiAlias,
                           child:
                          BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state){
                            if(state is LoadingProfile ){
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            else if (state is LoadedProfile ){
                              if(state.profile["profileImage"] == null){
                                return Text("N/A");
                              }else{
                                final versionedUrl = "${state.profile['profileImage']}?v=${state.profile['updatedAt']?.microsecondsSinceEpoch}";

                                return CachedNetworkImage(
                                  imageUrl: versionedUrl,
                                  key: ValueKey(versionedUrl),
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,

                                  placeholder: (context, url) {
                                    // child;
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                  errorWidget: (context, url, error ) {
                                    print("image error " + error.toString());
                                    print("image error " + error.toString());

                                    return const Icon(Icons.error, color: Colors.red);
                                  },
                                );

                              }
                            }
                            return Center(child: Text("error"),);
                          })

        ),
                       ),
                     ),
                      Align(
                        alignment: Alignment(0.3, 0.6),
                        child: Container(
                          height: 28,
                          width: 28,
                          padding: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            color: Color(0xFF737373),
                            borderRadius: BorderRadius.circular(18)
                          ),
                          child: Center(
                            child: IconButton(
                             // iconSize: 12,
                                onPressed: () async {
                                  storageRepo.pickAndUploadImage();
                              // final imageUrl = await storageRepo.uploadProfileImage(widget.currentUserId);
                              //
                              // try {
                              //   // Pick image
                              //   final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
                              //   if (picked == null) return null; // us
                              //   setState(() {
                              //     file = File(picked.path);
                              //
                              //   });// er cancelled
                              //   final path = 'profiles/profile.jpg';
                              //   print("Image Path" + picked.path.toString());
                              //
                              //   // print("Image Path" + path.toString());
                              // }  catch (e) {
                              //   print('❌ Upload failed: $e');
                              //   return null;
                              // }
                            },
                                icon: Icon(
                                  Icons.edit,
                                  size: 12,
                                )
                            ),
                          ),
                        )
                        ,
                      )
                    ],
                  ),
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
                  context.read<AuthBloc>().add(Logout());
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
