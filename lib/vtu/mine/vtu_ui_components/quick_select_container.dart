import 'package:flutter/cupertino.dart';

class QuickSelectContainer extends StatelessWidget {
  final String amount;
  const QuickSelectContainer({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      height: 30,
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: Color(0xFFEAEBED),
          borderRadius: BorderRadius.circular(8)
      ),
      child: Center(
        child: Text(
          "₦${amount}",
          style: TextStyle(
              color: Color(0xFF7A2D91),
              fontWeight: FontWeight.w600,
              fontSize: 12,
            overflow: TextOverflow.ellipsis
          ),

        ),
      ),
    ));
  }
}
