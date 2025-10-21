import 'package:chit_chat/vtu/mine/pay_bills_screen.dart';
import 'package:chit_chat/vtu/mine/vtu_ui_components/services_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'buy_airtime_screen.dart';
import 'data_purchase_screen.dart';
import 'fund_betting_screen.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Wallet Section
          Container(
            // height: size.height * 0.35,
            //margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 25),
            decoration: const BoxDecoration(
                color: Color(0xFF7A2D91),
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25) )
            ),
            child: SafeArea(child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Good evening', style: TextStyle(color: Colors.white70, fontSize: 12)),
                        SizedBox(height: 6),
                        Text('User 👋', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 20)),
                      ],
                    ),
                    Container(
                      //padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(Icons.person),
                    )

                  ],
                ),
                const SizedBox(height: 10,),
                Container(
                  // width: 40,
                  //height: 110,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFF8F4CA2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Wallet Balance', style: TextStyle(color: Colors.white70, fontSize: 12)),
                              SizedBox(height: 6),
                              Text('₦0', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 20)),
                            ],
                          ),
                          Icon(
                            Icons.hide_source,
                            size: 16,
                          )
                        ],
                      ),

                      SizedBox(height: 5,),

                      Container(
                        height: 40,
                        //width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: const Center(
                          child:
                          Text(
                            "+  Fund Wallet",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF8F4CA2),
                            ),
                          ),),
                      )
                    ],
                  ),
                )

              ],
            )),
          ),

          const SizedBox(height: 10,),

          //Promo section
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,),
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFFFD6B6B),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Flexible(child:   Text(
                          '🎉 Recharge & Get 5% Cashback!',
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          )),),

                      Text('Valid until Dec 31st', style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              )),

          SizedBox(height: 20,),


          //Services Section
          Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Services",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ServicesContainer(
                      serviceIcon: Icons.phone_android,
                      serviceName: "Buy Airtime",
                      serviceInfo: "Top up your phone",
                      serviceIconContainerColor: const Color(0xFFFDE9EA),
                      serviceIconColor: const Color(0xFFE59096),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> BuyAirtimeScreen()));

                      },),

                    const SizedBox(width: 10,), //N350

                    ServicesContainer(
                      serviceIcon: Icons.wifi,
                      serviceName: "Buy Data",
                      serviceInfo: "Internet bundles",
                      serviceIconContainerColor: Color(0xFFE8F7F7),
                      serviceIconColor: Color(0xFF78CABC),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> DataPurchaseScreen()));

                      },
                    )


                  ],
                ),

                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ServicesContainer(
                      serviceIcon: FontAwesomeIcons.lightbulb,
                      serviceName: "Pay Bills",
                      serviceInfo: "Electricity, TV, etc",
                      serviceIconContainerColor: Color(0xFFE8F7F7),
                      serviceIconColor: Color(0xFF78CABC),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> PayBillsScreen()));

                      },
                    ),

                    SizedBox(width: 10,),

                    ServicesContainer(
                      serviceIcon: FontAwesomeIcons.gamepad,
                      serviceName: "Fund Betting",
                      serviceInfo: "Sports betting",
                      serviceIconContainerColor: Color(0xFFEFF7F2),
                      serviceIconColor: Color(0xFFA6CFBD),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> FundBettingScreen()));


                      },

                    )


                  ],
                )


              ],
            ) ,),

          SizedBox(height: 15,),

          //Transaction Section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent Transactions",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16
                  ),
                ),

                Text(
                  "View All",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Colors.purple
                  ),
                ),
              ],
            ),
          )






        ],
      ),
    );
  }
}
