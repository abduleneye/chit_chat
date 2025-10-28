import 'package:chit_chat/features/auth/data/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/components/my_button.dart';
import '../../../core/components/my_textfield.dart';
import 'auth_bloc/auth_bloc.dart';
import 'auth_bloc/auth_event.dart';
import 'auth_bloc/auth_state.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //email and pw controllers
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _pwController = TextEditingController();

  final TextEditingController _cpwController = TextEditingController();

  //login method
  void register(BuildContext context) async {
    //get auth service
    if (_emailController.text.isEmpty ||
        _pwController.text.isEmpty ||
        _pwController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "fields can't be empty",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.blue,
      );
      if (_pwController.text != _cpwController.text) {
        Fluttertoast.showToast(
          msg: "password's don't match ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.blue,
        );
      }
    } else {
      context.read<AuthBloc>().add(SignUpWithEmailAndPassword(
          email: _emailController.text,
          password: _pwController.text,
          confirmPassword: _cpwController.text));
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
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16),
                ),

                const SizedBox(
                  height: 25,
                ),

                // email tf
                BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
                  if (authState is SignInLoading) {
                    return MyTextfield(
                      isEnabled: false,
                      hintText: 'Email',
                      isObscured: false,
                      textEditingController: _emailController,
                    );
                  } else {
                    return MyTextfield(
                      hintText: 'Email',
                      isObscured: false,
                      textEditingController: _emailController,
                    );
                  }
                }),

                const SizedBox(
                  height: 10,
                ),

                // pw tf
                BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
                  if (authState is SignUpLoading) {
                    return MyTextfield(
                      isEnabled: false,
                      hintText: 'Password',
                      isObscured: true,
                      textEditingController: _pwController,
                    );
                  } else {
                    return MyTextfield(
                      hintText: 'Password',
                      isObscured: true,
                      textEditingController: _pwController,
                    );
                  }
                }),
                const SizedBox(
                  height: 10,
                ),

                // cpw tf
                BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
                  if (authState is SignUpLoading) {
                    return MyTextfield(
                      isEnabled: false,
                      hintText: 'Password',
                      isObscured: true,
                      textEditingController: _cpwController,
                    );
                  } else {
                    return MyTextfield(
                      hintText: 'Password',
                      isObscured: true,
                      textEditingController: _cpwController,
                    );
                  }
                }),

                const SizedBox(
                  height: 15,
                ),
                //login button
                BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
                  if (authState is SignUpLoading) {
                    return MyButton(
                      isLoading: true,
                      onTap: () {
                        register(context);
                      },
                      buttonText: "SignUp",
                    );
                  } else {
                    return MyButton(
                      onTap: () {
                        register(context);
                      },
                      buttonText: "Sign Up",
                    );
                  }
                }),
                const SizedBox(
                  height: 15,
                ),

                //register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
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
