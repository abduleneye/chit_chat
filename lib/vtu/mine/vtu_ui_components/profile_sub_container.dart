import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileSubContainer extends StatelessWidget {
  final IconData actionIcon;
  final String actionText;
  final String subActionText;
  const ProfileSubContainer(
      {super.key,
      required this.actionIcon,
      required this.actionText,
      required this.subActionText});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFFF5EBF7)),
                    child: Center(
                      child: Icon(
                          actionIcon,
                          size: 16,
                          color: Color(0xFF7A2D91)),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(actionText,
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF5C6067),
                                fontWeight: FontWeight.w700),
                            overflow: TextOverflow.ellipsis),
                        Text(
                          subActionText,
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFACADAF),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            Icon(
            Icons.arrow_forward_ios_outlined,
                size: 16,
            color: Color(0xFFB9B9B9))
          ],
        ));
  }
}
