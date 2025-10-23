import 'package:chit_chat/vtu/mine/vtu_ui_components/how_it_works_container.dart';
import 'package:chit_chat/vtu/mine/vtu_ui_components/profile_sub_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Profile Header Section
          _profileHeaderSection(),

          //Account and service containers in a column
          _accountContainer(),

          _serviceContainer()





        ],
      ),
    );
  }


  Widget _profileHeaderSection(){
    return Container(
      // height: size.height * 0.35,
      //margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 25),
      decoration: const BoxDecoration(
          color: Color(0xFF7A2D91),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25))),
      child: SafeArea(
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Profile',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 20)),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              //John Does info
              Container(
                // width: 40,
                //height: 110,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                  color: Color(0xFF8F4CA2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //John Doe Info
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color(0xFFAF83BD) ),
                                child: Center(
                                  child: Icon(
                                      FontAwesomeIcons.person,
                                      size: 48,
                                      color: Color(0xFFFBFDFA)
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("John Doe",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xFFF3E8F5),
                                            fontWeight: FontWeight.w700),
                                        overflow: TextOverflow.ellipsis),
                                    Text(
                                      "Memeber since October 2024",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFFF3E8F5),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xFFAF83BD) ),
                          child: Center(
                            child: Icon(
                                FontAwesomeIcons.edit,
                                size: 16,
                                color: Color(0xFFFBFDFA)
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("47",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFFF3E8F5),
                                        fontWeight: FontWeight.w700),
                                    overflow: TextOverflow.ellipsis),
                                Text(
                                  "Transactions",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFFF3E8F5),
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          VerticalDivider(
                            thickness: 0.9,
                            // width: 10,
                            color: Color(0xFFF3E8F5),
                          ),

                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("₦2,500.75",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFFF3E8F5),
                                        fontWeight: FontWeight.w700),
                                    overflow: TextOverflow.ellipsis),
                                Text(
                                  "Wallet Balance",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFFF3E8F5),
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    //Contact Info
                    Container(
                      // width: 40,
                      //height: 110,
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        decoration: BoxDecoration(
                            color: Color(0xFF995DAA),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 2,
                                color: Color(0xFF8F4CA2)
                            )
                        ),

                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Contact Information",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFFF3E8F5),
                                    fontWeight: FontWeight.w700),
                                overflow: TextOverflow.ellipsis),
                            SizedBox(height: 8,),
                            Row(
                              children: [
                                Icon(
                                    FontAwesomeIcons.contactCard,
                                    size: 16,
                                    color: Color(0xFFFBFDFA)
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("johndoe@email.com",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFFF3E8F5),
                                        fontWeight: FontWeight.w700),
                                    overflow: TextOverflow.ellipsis),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Icon(
                                    FontAwesomeIcons.phone,
                                    size: 16,
                                    color: Color(0xFFFBFDFA)
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("+234 801 2345672",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFFF3E8F5),
                                        fontWeight: FontWeight.w700),
                                    overflow: TextOverflow.ellipsis),
                              ],
                            )
                          ],
                        )
                    )
                  ],
                ),
              ),


            ],
          )),
    );
  }

  Widget _accountContainer(){
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Account",
              style: TextStyle(
                // wordSpacing: 4,
                  fontSize: 16,
                  color: Color(0xFF4A4D55),
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 15,
            ),

            Container(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFFFDFDFD),
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Column(
                  children: [
                    ProfileSubContainer(
                      actionIcon: FontAwesomeIcons.edit,
                      actionText: 'Edit Profile',
                      subActionText: 'Update your personal information',

                    ),
                    ProfileSubContainer(
                      actionIcon: Icons.credit_card,
                      actionText: 'Payment Methods',
                      subActionText: 'Manage cards and bank accounts',

                    ),
                    ProfileSubContainer(
                      actionIcon: Icons.notifications,
                      actionText: 'Notifications',
                      subActionText: 'Customize you notification preferences',

                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 0,
            ),
          ],
        )
    );
  }

  Widget _serviceContainer(){
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Services",
              style: TextStyle(
                // wordSpacing: 4,
                  fontSize: 16,
                  color: Color(0xFF4A4D55),
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 15,
            ),

            Container(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFFFDFDFD),
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Column(
                  children: [
                    ProfileSubContainer(
                      actionIcon: Icons.phone_android,
                      actionText: 'Quick Recharge',
                      subActionText: 'Set up quick recharge preference',

                    ),
                    ProfileSubContainer(
                      actionIcon: Icons.people,
                      actionText: 'Referral Program',
                      subActionText: 'Refer and win points',

                    ),
                    ProfileSubContainer(
                      actionIcon: Icons.notifications,
                      actionText: 'Notifications',
                      subActionText: 'Customize you notification preferences',

                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),
          ],
        )
    );
  }



}
