import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ElectricityBillProviderContainer extends StatelessWidget {
  final String provider;
  final String minimumAmount;

  const ElectricityBillProviderContainer({
    super.key,
    required this.provider,
    required this.minimumAmount,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: 50,
      // width: size.width * 0.45,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Color(0xFFF1F1F1),
          ),
          borderRadius: BorderRadius.circular(12),
          color: Color(0xFFFDFDFD)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            provider,
            style: const TextStyle(
                color: Color(0xFF888A8E),
                fontWeight: FontWeight.w500,
                fontSize: 12),
          ),
          Text(
            "Min ₦${minimumAmount}",
            style: const TextStyle(
                color: Color(0xFFA4A5A9),
                fontWeight: FontWeight.w600,
                fontSize: 9),
          ),
        ],
      ),
    );
  }
}
