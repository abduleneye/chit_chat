import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TransactionHistoryContainer extends StatelessWidget {
  final bool credit;
  final String transactionName;
  final String? transactionTo;
  final String transactionDataTime;
  final String transactionAmount;
  final String transactionStatus;

  const TransactionHistoryContainer({
    super.key,
    required this.credit,
    required this.transactionName,
    this.transactionTo,
    required this.transactionDataTime,
    required this.transactionAmount,
    required this.transactionStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: credit ? Color(0xFFE0F6EF): Color(
                          0xFFFDE7E8) ),
                  child: Center(
                    child: Icon(
                        credit ? FontAwesomeIcons.arrowDown: FontAwesomeIcons.arrowUp,
                        size: 16,
                        color: credit ? Color(0xFF45C89C): Color(
                            0xFFEC8A91)
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(transactionName,
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF606467),
                              fontWeight: FontWeight.w700),
                          overflow: TextOverflow.ellipsis),
                      if (transactionTo != null)
                        Text(
                          transactionTo!,
                          style: TextStyle(
                              fontSize: 8,
                              color: Color(0xFF89898A),
                              fontWeight: FontWeight.w500),
                        ),
                      Text(
                        transactionDataTime,
                        style: TextStyle(
                            fontSize: 8,
                            color: Color(0xFF89898A),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                credit ? "+₦${transactionAmount}": "₦${transactionAmount}",
                style: TextStyle(
                    color: credit ? Color(0xFF45C89C): Color(
                        0xFFEC8A91),
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis),
              ),
              Container(
                padding: EdgeInsets.only(top: 1, left: 8, right: 8, bottom: 1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xFFE6F4EF),
                ),
                child: Center(
                  child: Text(
                    "Completed",
                    style: TextStyle(
                        fontSize: 8,
                        color: Color(0xFF7EE7C4),
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
