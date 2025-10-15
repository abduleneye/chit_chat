import 'package:chit_chat/features/auth/data/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/components/my_button.dart';
import '../../../core/components/my_textfield.dart';


class RegisterPage extends StatelessWidget {
  //email and pw controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _cpwController = TextEditingController();

  //tap to go to login page
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  //login method
  void register(BuildContext context) async {
    //get auth service
    final _auth = AuthService();
    if (_pwController.text == _cpwController.text) {
      try {
        await _auth.signUpWitEmailAndPassWord(
            _emailController.text, _pwController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    }else{
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("password's don't match"),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //logo
                Icon(
                  Icons.message,
                  size: 60,
                  color: Theme.of(context).colorScheme.primary,
                ),

                const SizedBox(
                  height: 50,
                ),

                //welcome back message
                Text(
                  "Let's create an account for you",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary, fontSize: 16),
                ),

                const SizedBox(
                  height: 25,
                ),

                // email tf
                MyTextfield(
                  hintText: 'Email',
                  isObscured: false,
                  textEditingController: _emailController,
                ),

                const SizedBox(
                  height: 10,
                ),

                // pw tf
                MyTextfield(
                  hintText: 'Password',
                  isObscured: true,
                  textEditingController: _pwController,
                ),
                const SizedBox(
                  height: 10,
                ),

                // cpw tf
                MyTextfield(
                  hintText: 'Confirm Password',
                  isObscured: true,
                  textEditingController: _cpwController,
                ),

                const SizedBox(
                  height: 15,
                ),
                //login button
                MyButton(
                  onTap: () {
                    register(context);
                  },
                  buttonText: "Register",
                ),
                const SizedBox(
                  height: 15,
                ),

                //register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: Text(
                        "Login now",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
