import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomAppBarIcon extends StatefulWidget {
  final String bottomText;
  final Icon bottomIcon;
  final bool isSelected;
  final VoidCallback onPressed;
  const BottomAppBarIcon(
      {super.key,
      required this.bottomText,
      required this.bottomIcon,
      required this.isSelected,
      required this.onPressed});

  @override
  State<BottomAppBarIcon> createState() => _BottomAppBarIconState();
}

class _BottomAppBarIconState extends State<BottomAppBarIcon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Column(
        children: [
          Container(
            height: 32,
            width: 64,
            decoration: BoxDecoration(
                color: widget.isSelected
                    ? Colors.lightGreen[200]
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: widget.bottomIcon,
            ),
          ),
          Text(
            widget.bottomText,
            style: TextStyle(
                fontWeight:
                    widget.isSelected ? FontWeight.bold : FontWeight.normal),
          )
        ],
      ),
    );
  }
}
