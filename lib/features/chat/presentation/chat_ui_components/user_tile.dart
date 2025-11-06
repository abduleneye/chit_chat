import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../ephemerals/data/presence_service.dart';

class UserTile extends StatelessWidget {
  final void Function()? onTap;
  final String userName;
  final bool isOnline;
  final String otherUserId;
  const UserTile({super.key, this.onTap,
    required this.userName, required this.isOnline, required this.otherUserId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      //  height: MediaQuery.of(context).size.height / 1.5, // half screen height
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12)
        ),
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
                     backgroundColor:  Colors.red,
                   );

                   final data = snapshot.data!;
                   final isOnline = data["isOnline"] ?? false;

                   if (isOnline) {
                     return   CircleAvatar(
                       radius: 8,
                       backgroundColor:  Colors.green,
                     );
                   } else {
                     return   CircleAvatar(
                       radius: 8,
                       backgroundColor:  Colors.red,
                     );
                   }
                 },
               ),
               //

             ],
           ),

               CircleAvatar(
                 radius: 80,
                 child:  Icon(
                   Icons.person,
                   size: 150,
                 ),
               ),

                SizedBox(height: 25,),

          Text(
            userName,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.black
            ),
          ),
            SizedBox(height: 25,),

            StreamBuilder(
              stream: PresenceService().getUserStatus(otherUserId),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Text("Offline");

                final data = snapshot.data!;
                final isOnline = data["isOnline"] ?? false;

                if (isOnline) {
                  return const Text("Online", style: TextStyle(color: Colors.green));
                } else {

                  final lastSeen = DateTime.fromMillisecondsSinceEpoch(data["lastSeen"]);
                  final formatted = DateFormat('EEEE HH:mm').format(lastSeen.toLocal());

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
