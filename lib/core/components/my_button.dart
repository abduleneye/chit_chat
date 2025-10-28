import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final bool isLoading;
  final void Function()? onTap;
  final String buttonText;
  const MyButton({super.key, required this.buttonText, this.onTap,  this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(8)
        ),
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: isLoading ? SizedBox(height: 20, width: 20, child: CircularProgressIndicator(),):Text(buttonText),
        ),
      ),

    );
  }
}
