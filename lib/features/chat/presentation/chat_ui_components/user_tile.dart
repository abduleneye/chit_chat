import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final void Function()? onTap;
  final String userName;
  const UserTile({super.key, this.onTap, required this.userName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12)
        ),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(
              Icons.person
            ),

            SizedBox(width: 20,),
            
            Text(
                userName,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
