import 'package:flutter/cupertino.dart';

class HowItWorksContainer extends StatelessWidget {
  final String stepNumber;
  final String objective;
  final String how;
  const HowItWorksContainer(
      {super.key,
      required this.objective,
      required this.how, required this.stepNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xFF7E3093)),
            child: Center(
              child: Text(
                stepNumber,
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFFF4D3F9),
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Flexible(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                objective,
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF3C4450),
                    fontWeight: FontWeight.w700),
              ),
              Text(
                how,
                style: TextStyle(overflow: TextOverflow.ellipsis,
                    fontSize: 10,
                    color: Color(0xFF3C4450),
                    fontWeight: FontWeight.w500),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
