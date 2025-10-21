import 'package:chit_chat/vtu/mine/vtu_ui_components/betting_platform_container.dart';
import 'package:chit_chat/vtu/mine/vtu_ui_components/quick_select_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FundBettingScreen extends StatelessWidget {
   FundBettingScreen({super.key});

  List<BettingPlatformContainer>  betProviders = [
    BettingPlatformContainer(
      betProvider: 'Bet9ja',
      minimumAmount: '100',
      betProviderStatement: 'Fund your Bet9ja account instantly',
      containerColor: Color(0xFF02A653),
    ),

    BettingPlatformContainer(
      betProvider: 'SportyBet',
      minimumAmount: '100',
      betProviderStatement: 'Top up your SportyBet wallet',
      containerColor: Color(0xFFFB6603),
    ),

    BettingPlatformContainer(
      betProvider: '1xBet',
      minimumAmount: '100',
      betProviderStatement: 'Add funds to your 1xBet account',
      containerColor: Color(0xFF2240AA),
    ),
    BettingPlatformContainer(
      betProvider: 'BetKing',
      minimumAmount: '100',
      betProviderStatement: 'Recharge your BetKing wallet',
      containerColor: Color(0xFFD5261F),
    ),
    BettingPlatformContainer(
      betProvider: 'NairaBet',
      minimumAmount: '100',
      betProviderStatement: 'Fund your NairaBet account',
      containerColor: Color(0xFF02976A),
    ),
    BettingPlatformContainer(
      betProvider: 'Betway',
      minimumAmount: '100',
      betProviderStatement: 'Top up your Betway wallet',
      containerColor: Color(0xFF7F38F2),
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFFFDFDFD),
        ),
        child: Scaffold(
            backgroundColor: Color(0xFFFDFDFD),
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(
                    kToolbarHeight), // 👈 10% of screen height
                child: Container(
                  // height: size.height * 0.35,
                  //margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding: const EdgeInsets.only(
                      top: 40, left: 10, right: 10, bottom: 0),
                  decoration: const BoxDecoration(
                      color: Color(0xFFFDFDFD),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(0),
                          bottomLeft: Radius.circular(0))),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: const Color(0xFFF1F2F4),
                                ),
                                child: const Center(
                                    child: Icon(
                                  Icons.arrow_back,
                                  color: Color(0xFF51545B),
                                )),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                                alignment: Alignment.center,
                                child: const Text(
                                  "Betting",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF163854),
                                      fontWeight: FontWeight.bold),
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                )),
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child:

                  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Select Betting Platform Section
                  const Text(
                    "Select Betting Platform",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF74767A),
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 6,
                  ),

                //  Bet Selection Expanded Column
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(vertical: 0),
                      itemCount: betProviders.length,
                      itemBuilder: (context, index) {
                        return BettingPlatformContainer(
                          betProvider: betProviders[index].betProvider,
                          minimumAmount: betProviders[index].minimumAmount,
                          betProviderStatement: betProviders[index].betProviderStatement,
                          containerColor: betProviders[index].containerColor,
                        );
                      }),

                  SizedBox(height: 15,),


                  //Customer ID/Username Section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10,),
                      const Text(
                        "Customer ID / Username",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFADAFB5),
                            fontWeight: FontWeight.w600

                        ),
                      ),
                      const SizedBox(height: 10,),

                      Container(
                        padding: EdgeInsets.only(left: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xFFEFEFEF),
                          ),
                          borderRadius: BorderRadius.circular(12),
                      //    color: Color(0xFFFDFDFD),
                        ),
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  //  color: Color(0xFFF3ECF6)
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.person,
                                    color: Color(0xFF8A8C90),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      fillColor: Color(0xFFFDFDFD),
                                      filled: true,
                                      hintText: "Enter your custom ID or username",
                                      hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary)),
                                ),
                              ),
                              SizedBox(width: 6,)

                            ],
                          ),
                        ),
                      )




                    ],
                  ),

                  SizedBox(height: 15,),

                  //Amount Section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10,),
                      const Text(
                        "Amount",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF66696F),
                            fontWeight: FontWeight.w600

                        ),
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xFFEFEFEF),
                          ),
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xFFFDFDFD),
                        ),
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  //  color: Color(0xFFF3ECF6)
                                ),
                                child: Center(
                                  child:
                                  Center(
                                    child: Icon(
                                      Icons.wallet,
                                      color: Color(0xFF8B8D91),
                                    ),
                                  ),

                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      fillColor: Color(0xFFFDFDFD),
                                      filled: true,
                                      hintText: "₦ 0",
                                      hintStyle: TextStyle(
                                        fontSize: 14,
                                          color: Theme.of(context).colorScheme.primary)
                                  ),
                                ),
                              ),
                              SizedBox(width: 6,)

                            ],
                          ),
                        ),
                      )




                    ],
                  ),

                  //Quick Select Section
                  const SizedBox(height: 10,),
                  const Text(
                    "Quick Select",
                    style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF66696F),
                        fontWeight: FontWeight.w600

                    ),
                  ),
                  const SizedBox(height: 10,),

                  Column(
                    children: [
                      Row(
                        children: [
                          QuickSelectContainer(amount: '500',),
                          QuickSelectContainer(amount: '1,000'),
                          QuickSelectContainer(amount: '2,000'),
                          QuickSelectContainer(amount: '5,000',)




                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          QuickSelectContainer(amount: '10,000'),
                          QuickSelectContainer(amount: '20,000',)
                        ],
                      )
                    ],
                  ),

                  //Fund Account Button Section
                  SizedBox(height: 30,),

                  Container(
                    height: 50,
                    //width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xFF9BA1AD),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          size: 20,
                          Icons.monetization_on_outlined,
                          color: Color(0xFFFDF0E9),


                        ),

                        SizedBox(width: 5,),
                        Text(
                          "Fund Account",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFFDFCF5),
                              fontWeight: FontWeight.bold

                          ),
                        )

                      ],
                    ),

                  ),



                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ))));
  }
}
