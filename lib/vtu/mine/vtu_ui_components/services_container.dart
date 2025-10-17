import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServicesContainer extends StatelessWidget {
  final IconData serviceIcon;
  final String serviceName;
  final String serviceInfo;
  final Color serviceIconContainerColor;
  final Color serviceIconColor;

  const ServicesContainer(
      {super.key,
      required this.serviceIcon,
      required this.serviceName,
      required this.serviceInfo,
      required this.serviceIconContainerColor,
        required this.serviceIconColor});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Expanded(child: Container(
      height: 100,
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
                borderRadius: BorderRadius.circular(8),
                color: serviceIconContainerColor),
            child: Center(
              child: Icon(
                serviceIcon,
                color: serviceIconColor,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(serviceName),
          Text(
            serviceInfo,
            style: TextStyle(
                fontSize: 8,
                color: Colors.grey
            ),
          )
        ],
      ),
    ));
  }
}
