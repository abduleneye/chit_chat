import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreeng extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreeng> {
  @override
  void initState() {
    super.initState();
    // Timer(Duration(milliseconds: 1500), () {
    //   Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    // });
  }

  @override
  Widget build(BuildContext context) {
    final purple = Theme.of(context).primaryColor;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: purple,
      body: SafeArea(
        child: Stack(
          children: [
            // decorative faded circles
            Positioned(
              left: -size.width * .20 + 10,
              top: -size.height * .05 + 50,
              child: Container(
                width: size.width * .6,
                height: size.width * .8,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              right: -size.width * .25 + 25,
              bottom: -size.height * .08 + 110, // or a fixed -50 if easier
              child: Container(
                width: size.width * .7,
                height: size.width * .8,
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
              ),
            ),

            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 88,
                    height: 88,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 6),
                        )
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'T',
                      style: TextStyle(
                        color: purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                      ),
                    ),
                  ),
                  SizedBox(height: 22),
                  Text(
                    'TopCred',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 28,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Pay bills, Live Easy',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Secure •  Fast • Reliable',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Your trusted fintech partner',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    SizedBox(height: 40),

                  ],
                )
            ),

          ],
        ),
      ),
    );
  }
}