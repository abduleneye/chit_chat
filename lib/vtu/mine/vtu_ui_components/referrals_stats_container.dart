import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ReferralsStatsContainer extends StatelessWidget {
  final IconData serviceIcon;
  final String statValue;
  final String statName;
  final Color statIconContainerColour;
  final Color statIconColour;
  final Function onTap;

  const ReferralsStatsContainer(
      {super.key,
        required this.serviceIcon,
        required this.statValue,
        required this.statName,
        required this.statIconContainerColour,
        required this.statIconColour, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Expanded(
        child: GestureDetector(
          onTap: (){
            onTap();
          },
          child: Container(
            height: 100,
            width: 8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xFFFDFDFD)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: statIconContainerColour),
                  child: Center(
                    child: Icon(
                      serviceIcon,
                      color: statIconColour,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    statValue,
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF3C4450),
                      fontWeight: FontWeight.w900
                  ),
                ),
                Text(
                  statName,
                  style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFFB4B5B5),
                    fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
