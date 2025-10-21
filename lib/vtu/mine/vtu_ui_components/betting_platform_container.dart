import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BettingPlatformContainer extends StatelessWidget {
  final String betProvider;
  final Color containerColor;
  final String betProviderStatement;
  final String minimumAmount;

  const BettingPlatformContainer({
    super.key,
    required this.betProvider,
    required this.minimumAmount,
    required this.betProviderStatement,
    required this.containerColor,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Color(0xFFF1F1F1)),
        borderRadius: BorderRadius.circular(12),
        color: Color(0xFFFDFDFD),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 👇 Wrap the inner Row in Flexible
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.monetization_on_outlined,
                      color: Color(0xFFC5D4FD),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // 👇 Also make Column flexible
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        betProvider,
                        style: const TextStyle(
                          color: Color(0xFF4C4F55),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        betProviderStatement,
                        style: const TextStyle(
                          color: Color(0xFFA4A5A9),
                          fontWeight: FontWeight.w600,
                          fontSize: 11,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Text(
            "Min ₦$minimumAmount",
            style: const TextStyle(
              color: Color(0xFFA4A5A9),
              fontWeight: FontWeight.w600,
              fontSize: 9,
            ),
          ),
        ],
      ),
    );

  }
}
