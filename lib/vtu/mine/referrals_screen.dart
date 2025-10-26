import 'package:chit_chat/vtu/mine/vtu_ui_components/how_it_works_container.dart';
import 'package:chit_chat/vtu/mine/vtu_ui_components/referrals_stats_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReferralsScreen extends StatelessWidget {
  ReferralsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Stack(
       // clipBehavior: Clip.none,
        children: [
          // Top Container
          Container(
            //  height: 150,
            width: double.infinity,
            padding:
                const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 25),
            decoration: const BoxDecoration(
              color: Color(0xFF7A2D91),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: const SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Referrals',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Earn ₦20 for every friend you invite!',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Floating Column
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                ),

                // Stat Value Containers
                Row(
                  children: [
                    ReferralsStatsContainer(
                      serviceIcon: FontAwesomeIcons.person,
                      statValue: '42',
                      statName: 'Total Referrals',
                      statIconContainerColour: const Color(0xFFEAE1EC),
                      statIconColour: const Color(0xFF936BA3),
                      onTap: () {},
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ReferralsStatsContainer(
                      serviceIcon: FontAwesomeIcons.moneyBill,
                      statValue: '₦420',
                      statName: 'Total Earnings',
                      statIconContainerColour: const Color(0xFFE4F3EE),
                      statIconColour: const Color(0xFF389B79),
                      onTap: () {},
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ReferralsStatsContainer(
                      serviceIcon: FontAwesomeIcons.star,
                      statValue: '₦60',
                      statName: 'Pending Bonus',
                      statIconContainerColour: const Color(0xFFFDF1DC),
                      statIconColour: const Color(0xFFDBBB7A),
                      onTap: () {},
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                //Referral Code Container
                Container(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xFFFDFDFD),
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          padding: EdgeInsets.all(10),
                          //width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                size: 20,
                                FontAwesomeIcons.gift,
                                color: Color(0xFF6B2785),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Your Referral Code",
                                style: TextStyle(
                                    // wordSpacing: 4,
                                    fontSize: 16,
                                    color: Color(0xFF4A4D55),
                                    fontWeight: FontWeight.w600),
                              ),
                              //SizedBox(width: 5,),
                            ],
                          ),
                        ),
                        Container(
                          height: 60,
                          padding: EdgeInsets.all(10),
                          //width: double.infinity,
                          decoration: BoxDecoration(
                              color: Color(0xFFF1F2F4),
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "TOPCRED2024JD",
                                style: TextStyle(
                                    // wordSpacing: 4,
                                    fontSize: 18,
                                    color: Color(0xFF6B2785),
                                    fontWeight: FontWeight.w900),
                              ),
                              //SizedBox(width: 5,),
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xFF6D317F),
                                ),
                                child: Center(
                                  child: Icon(
                                    size: 16,
                                    Icons.copy,
                                    color: Color(0xFFFDF0E9),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        //Share button container
                        Container(
                          height: 40,
                          //width: double.infinity,
                          decoration: BoxDecoration(
                              color: Color(0xFF7A2D91),
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                size: 20,
                                Icons.share,
                                color: Color(0xFFFDF0E9),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Share",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFFFDFCF5),
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 30,
                ),
                //How It Works Container

                Text(
                  "How It Works",
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
                  padding:
                      EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xFFFDFDFD),
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Column(
                      children: [
                        HowItWorksContainer(
                          stepNumber: "1",
                          objective: "Share your code",
                          how: 'Send your referral code to friends',
                        ),
                        HowItWorksContainer(
                          stepNumber: "2",
                          objective: "Friend signs up",
                          how: 'They use your code during registration',
                        ),
                        HowItWorksContainer(
                          stepNumber: "3",
                          objective: "First transaction",
                          how: 'Friend makes their first transaction',
                        ),
                        HowItWorksContainer(
                          stepNumber: "4",
                          objective: "Get paid",
                          how: 'Earn ₦20 bonus instantly!',
                        )
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                Text(
                  "Recent Referrals",
                  style: TextStyle(
                    // wordSpacing: 4,
                      fontSize: 16,
                      color: Color(0xFF4A4D55),
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
