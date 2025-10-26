import 'package:chit_chat/features/auth/presentation/auth_gate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../vtu/mine/home_vtu.dart';
import 'package:chit_chat/vtu/s_gpt.dart';

class HomeHome extends StatelessWidget {
  const HomeHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  AnnotatedRegion(value: SystemUiOverlayStyle(
      statusBarColor: Color(0xFF7A2D91),
    ), child: Scaffold(
      backgroundColor: Color(0xFF7A2D91),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
          child: ConstrainedBox(constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> AuthGate()));

                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFF9A5EAA),
                                borderRadius: BorderRadius.circular(8)
                            ),
                            height: 100,
                            child: Center(
                              child: Text(
                                  "Chat App",
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15,),
                      Flexible(
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> SplashScreeng()));

                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFF9A5EAA),
                                borderRadius: BorderRadius.circular(8)
                            ),
                            height: 100,
                            child: Center(
                              child: Text(
                                  "VTU App",
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ),
                      )

                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
