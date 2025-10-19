import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectNetworkCardAirtime extends StatelessWidget {
  final String networkFirstLetter;
  final String networkName;
  final Color serviceIconContainerColor;
  final Color networkLetterColour;

  const SelectNetworkCardAirtime(
      {super.key,
        required this.networkFirstLetter,
        required this.networkName,
        required this.serviceIconContainerColor,
        required this.networkLetterColour});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Expanded(child: Container(
      height: 80,
      // width: size.width * 0.45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white70),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: serviceIconContainerColor),
            child: Center(
              child: Text(
                  networkFirstLetter,
                style: TextStyle(
                  color: networkLetterColour,
                  fontWeight: FontWeight.w900
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
              networkName,
            style: const TextStyle(
                color: Color(0xFF86898E),
                fontWeight: FontWeight.w900,
              fontSize: 12
            ),
          ),
         
        ],
      ),
    ));
  }
}
