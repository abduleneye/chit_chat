import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectBillCategoryContainer extends StatelessWidget {
  final String networkName;
  final Color iconColor;
  final IconData billPaymentIcon;

  const SelectBillCategoryContainer(
      {super.key,
        required this.networkName,
        required this.iconColor,
        required this.billPaymentIcon});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Expanded(child: Container(
      height: 80,
      // width: size.width * 0.45,
      decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Color(0xFFEEEEEF),
          ),
          borderRadius: BorderRadius.circular(12),
          color: Color(0xFFFDFDFD)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Icon(
            billPaymentIcon,
            color: iconColor,
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
