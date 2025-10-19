import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectNetworkCardData extends StatelessWidget {
  final String networkName;
  final Color wifiIconColor;

  const SelectNetworkCardData(
      {super.key,
        required this.networkName,
        required this.wifiIconColor});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Expanded(child: Container(
      height: 80,
      // width: size.width * 0.45,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
            color: Color(0xFFF1F1F1),
        ),
          borderRadius: BorderRadius.circular(12),
          color: Color(0xFFFDFDFD)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
              Icons.wifi,
            color: wifiIconColor,
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
