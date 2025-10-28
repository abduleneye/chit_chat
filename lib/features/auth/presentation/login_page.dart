import 'package:chit_chat/features/auth/data/auth_service.dart';
import 'package:chit_chat/features/auth/presentation/auth_bloc/auth_state.dart';
import 'package:chit_chat/features/auth/presentation/login_or_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/components/my_button.dart';
import '../../../core/components/my_textfield.dart';
import 'auth_bloc/auth_bloc.dart';
import 'auth_bloc/auth_event.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;


  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //email and pw controllers
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _pwController = TextEditingController();

  //login method
  void login(BuildContext context) async{
    if(_emailController.text.isEmpty || _pwController.text.isEmpty){
      Fluttertoast.showToast(
        msg: "fields can't be empty",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.blue,
      );

    } else {
      context.read<AuthBloc>().add(SignInWithEmailAndPassword(email: _emailController.text, password: _pwController.text));

    }

    // //auth service
    // final authService = AuthService();
    //
    // //try login
    // try{
    //   await authService.signInWithEmailAndPassword(_emailController.text, _pwController.text);
    // } catch(e){
    //   showDialog(context: context, builder: (context) => AlertDialog(
    //     title: Text(e.toString()),
    //   ));
    // }

  }

  @override
  Widget build(BuildContext context) {
    return  AnnotatedRegion(value: SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).colorScheme.surface,
    ), child: Scaffold(
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
                  "Welcome back you've been missed",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary, fontSize: 16),
                ),

                const SizedBox(
                  height: 25,
                ),

                // email tf
            BlocBuilder<AuthBloc, AuthState>(builder: (context, authState){
              if(authState is SignInLoading){
                return  MyTextfield(
                  isEnabled: false,
                  hintText: 'Email',
                  isObscured: false,
                  textEditingController: _emailController,
                );
              } else{
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
               BlocBuilder<AuthBloc, AuthState>(builder: (context, authState){
                 if(authState is SignInLoading){
                   return  MyTextfield(
                     isEnabled: false,
                     hintText: 'Password',
                     isObscured: true,
                     textEditingController: _pwController,
                   );
                 } else{
                   return MyTextfield(
                     hintText: 'Password',
                     isObscured: true,
                     textEditingController: _pwController,
                   );
                 }
               }),

                const SizedBox(
                  height: 15,
                ),
                //login button
                BlocBuilder<AuthBloc, AuthState>(builder: (context, authState){
                  if(authState is SignInLoading){
                    return MyButton(
                      isLoading: true,
                      onTap: (){
                        login(context);
                      },
                      buttonText: "Login",
                    );
                  } else {
                    return MyButton(
                      onTap: (){
                        login(context);
                      },
                      buttonText: "Login",
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
                      "Not a member? ",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child:  Text(
                        "Register now",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary

                        ),
                      ),
                    )
                  ],
                )

              ],
            ),
          ),
        )));
  }
}
