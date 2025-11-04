import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final bool isEnabled;
  final bool makeAutoFocus;
  final String hintText;
  final bool isObscured;
  final TextEditingController textEditingController;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  const MyTextfield(
      {super.key,
        this.isEnabled = true,
      required this.hintText,
      required this.isObscured,
      required this.textEditingController,
      this.focusNode,  this.makeAutoFocus = false, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        onChanged: onChanged,
        autofocus: makeAutoFocus,
        enabled: isEnabled,
        controller: textEditingController,
        obscureText: isObscured,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.tertiary),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: Theme.of(context).colorScheme.tertiary),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary)),
            fillColor: Theme.of(context).colorScheme.secondary,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary)),
      ),
    );
  }
}
