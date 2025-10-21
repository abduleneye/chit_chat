import 'dart:ffi';

import 'package:chit_chat/vtu/mine/data_purchase_screen.dart';
import 'package:chit_chat/vtu/mine/fund_betting_screen.dart';
import 'package:chit_chat/vtu/mine/pay_bills_screen.dart';
import 'package:chit_chat/vtu/mine/referrals_screen.dart';
import 'package:chit_chat/vtu/mine/vtu_ui_components/services_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../main.dart';
import 'buy_airtime_screen.dart';
import 'dash_board_screen.dart';

class HomeVtu extends StatefulWidget {
   HomeVtu({super.key});

  @override
  State<HomeVtu> createState() => _HomeVtuState();
}

class _HomeVtuState extends State<HomeVtu> with RouteAware {
  int _selectedBottomIcon = 0;

  String selectedValue = "";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();


  }
@override
  void didPopNext() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Color(0xFF7A2D91)
      )
  );    super.didPopNext();
  }
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: Color(0xFF7A2D91)
        )
    );     super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;


    return AnnotatedRegion(value: SystemUiOverlayStyle(
        statusBarColor: Color(0xFF7A2D91)
    ), child: Scaffold(
      extendBodyBehindAppBar: true,
      //backgroundColor: ,
      body:IndexedStack(
        index: _selectedBottomIcon,
        children: [
          DashBoardScreen(),
          ReferralsScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Color(0xFF8B5BA8),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 10,
        ),
        currentIndex: _selectedBottomIcon,
        onTap: (index){
          setState(() {
            _selectedBottomIcon = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard_rounded),
            label: 'Referrals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),

    ));
  }
}
