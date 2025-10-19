import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectDataPlanContainer extends StatelessWidget {
  final String gigAmount;
  final String validityPeriod;
  final String price;

  const SelectDataPlanContainer({
    super.key,
    required this.gigAmount,
    required this.validityPeriod,
    required this.price,
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
            "${gigAmount}GB - ${validityPeriod} Days",
            style: const TextStyle(
                color: Color(0xFF888A8E),
                fontWeight: FontWeight.w600,
                fontSize: 12),
          ),
          Text(
            "₦${price}",
            style: const TextStyle(
                color: Color(0xFF6F437F),
                fontWeight: FontWeight.w600,
                fontSize: 12),
          ),

        ],
      ),
    );
  }
}
