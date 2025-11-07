import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../ephemerals/data/presence_service.dart';
import '../../../users_profile/presentation/profile_bloc/profile_bloc.dart';
import '../../../users_profile/presentation/profile_bloc/profile_state.dart';

class UserTile extends StatelessWidget {
  final void Function()? onTap;
  final String userName;
  final bool isOnline;
  final String otherUserId;
  final String? profilePicUrl;
  final Timestamp? updatedAt;

  UserTile({
    super.key,
    this.onTap,
    required this.userName,
    required this.isOnline,
    required this.otherUserId,
    required this.profilePicUrl,
    required this.updatedAt,
  });

  @override
  Widget build(BuildContext context) {
    final versionedUrl =
        "${profilePicUrl}?v=${updatedAt?.toDate()}";

    return GestureDetector(
      onTap: onTap,
      child: Container(
        //  height: MediaQuery.of(context).size.height / 1.5, // half screen height
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 25),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                StreamBuilder(
                  stream: PresenceService().getUserStatus(otherUserId),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.red,
                      );

                    final data = snapshot.data!;
                    final isOnline = data["isOnline"] ?? false;

                    if (isOnline) {
                      return CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.green,
                      );
                    } else {
                      return CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.red,
                      );
                    }
                  },
                ),
                //
              ],
            ),
            Center(
              child: CircleAvatar(
                radius: 40,
                child: ClipOval(
                    //clipBehavior: Clip.hardEdge,
                    child: profilePicUrl == null
                        ? Text("N/A")
                        : CachedNetworkImage(
                            useOldImageOnUrlChange: true,
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
                            errorWidget: (context, url, error) {
                              print("image error " + error.toString());
                              print("image error " + error.toString());

                              return const Icon(Icons.error, color: Colors.red);
                            },
                          )),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              userName,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 25,
            ),
            StreamBuilder(
              stream: PresenceService().getUserStatus(otherUserId),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Text("Offline");

                final data = snapshot.data!;
                final isOnline = data["isOnline"] ?? false;

                if (isOnline) {
                  return const Text("Online",
                      style: TextStyle(color: Colors.green));
                } else {
                  final lastSeen =
                      DateTime.fromMillisecondsSinceEpoch(data["lastSeen"]);
                  final formatted =
                      DateFormat('EEEE HH:mm').format(lastSeen.toLocal());

                  return Text(
                    "Last seen on:  $formatted",
                    style: TextStyle(fontSize: 12),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
