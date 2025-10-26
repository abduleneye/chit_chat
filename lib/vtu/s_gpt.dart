import 'dart:async';
import 'package:flutter/material.dart';
import 'package:chit_chat/vtu/mine/home_vtu.dart';

class SplashScreeng extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreeng> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1500), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeVtu()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final purple = Theme.of(context).primaryColor;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF7A2D91),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // decorative faded circles (scaled)
            Align(
              alignment: Alignment.centerLeft,
              child: Transform.translate(
                offset: Offset(-size.width * 0.13, -size.height * 0.2),
                child: CircleAvatar(
                  radius: size.width * 0.3,
                  backgroundColor: const Color(0xFF8D276E),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Transform.translate(
                offset: Offset(size.width * 0.15, size.height * 0.1),
                child: CircleAvatar(
                  radius: size.width * 0.33,
                  backgroundColor: const Color(0xFF8D276E),
                ),
              ),
            ),

            // main logo & name
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: size.width * 0.25,
                  height: size.width * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: const [
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
                      fontSize: size.width * 0.1,
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                Text(
                  'TopCred',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: size.width * 0.07,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Pay bills, Live Easy',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),

            // bottom tagline
            Positioned(
              bottom: 40,
              child: Column(
                children: [
                  Text(
                    'Secure • Fast • Reliable',
                    style: TextStyle(
                      fontSize: size.width * 0.035,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Your trusted fintech partner',
                    style: TextStyle(
                      fontSize: size.width * 0.035,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
