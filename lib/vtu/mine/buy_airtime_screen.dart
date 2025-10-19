import 'package:chit_chat/vtu/mine/home_vtu.dart';
import 'package:chit_chat/vtu/mine/vtu_ui_components/select_network_card_airtime.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../main.dart';

class BuyAirtimeScreen extends StatefulWidget {
  const BuyAirtimeScreen({super.key});


  @override
  State<BuyAirtimeScreen> createState() => _BuyAirtimeScreenState();
}


class _BuyAirtimeScreenState extends State<BuyAirtimeScreen> with RouteAware{
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
          statusBarColor: Color(0xFFFD6B6B),
        )
    );
    super.didPopNext();
  }
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Color(0xFFFD6B6B),
        )
    );    super.initState();
  }


  @override
  Widget build(BuildContext context) {


    return AnnotatedRegion(value:  const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFFD6B6B),
    ), child: Scaffold(

      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(110), // 👈 10% of screen height
          child: Container(
            // height: size.height * 0.35,
            //margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 25),
            decoration: const BoxDecoration(
                color: Color(0xFFFD6B6B),
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25) )
            ),
            child: Column(
              children: [

                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFFFB8688),
                        ),
                        child: const Center(
                            child: Icon(
                              Icons.arrow_back,
                              color: Color(0xFFFDF0E9),

                            )
                        ),
                      ),
                    ),
                    const SizedBox(width: 15,),
                    const Text(
                      "Buy Airtime",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFFFDFCF5),
                          fontWeight: FontWeight.bold

                      ),
                    )

                  ],
                ),
                const SizedBox(height: 15,),
                const Row(
                  children: [
                    Icon(
                      size: 20,
                      Icons.phone_android,
                      color: Color(0xFFFDF0E9),


                    ),

                    SizedBox(width: 5,),
                    Text(
                      "Top up your phone instantly",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFFFDFCF5),
                        // fontWeight: FontWeight.bold

                      ),
                    )

                  ],
                )
              ],
            )
            ,
          )),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Select Network Section
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select Network",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF32353B),
                        fontWeight: FontWeight.w600

                    ),
                  ),

                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SelectNetworkCardAirtime(
                        serviceIconContainerColor: Color(0xFFFDF4E3),
                        networkLetterColour: Color(0xFFFCDA76),
                        networkFirstLetter: 'M',
                        networkName: 'MTN',),

                      SizedBox(width: 10,),

                      SelectNetworkCardAirtime(
                        serviceIconContainerColor: Color(0xFFFBDFE1),
                        networkLetterColour: Color(0xFFBD4E53),
                        networkFirstLetter: 'A',
                        networkName: 'Airtel',),


                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SelectNetworkCardAirtime(
                        serviceIconContainerColor: Color(0xFFDEF1E4),
                        networkLetterColour: Color(0xFF60B689),
                        networkFirstLetter: 'G',
                        networkName: 'Glo',),

                      SizedBox(width: 10,),

                      SelectNetworkCardAirtime(
                        serviceIconContainerColor: Color(0xFFDCF2E9),
                        networkLetterColour: Color(0xFFE59096),
                        networkFirstLetter: '9',
                        networkName: '9mobile',),


                    ],
                  ),
                ],
              ),

              //Phone Number Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10,),
                  const Text(
                    "Phone Number",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF32353B),
                        fontWeight: FontWeight.w600

                    ),
                  ),
                  const SizedBox(height: 10,),

                  Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 50,
                    decoration: BoxDecoration(
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
                                color: Color(0xFFF3ECF6)),
                            child: Center(
                              child: Icon(
                                Icons.person,
                                color: Color(0xFFB59ABC),
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
                                  //  hintText: hintText,
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

              //Amount Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10,),
                  const Text(
                    "Amount",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF32353B),
                        fontWeight: FontWeight.w600

                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 50,
                    decoration: BoxDecoration(
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
                                color: Color(0xFFF3ECF6)),
                            child: Center(
                              child: Text(
                                  "₦",
                                  style: TextStyle(
                                      color: Color(0xFF6F417D),
                                      fontWeight: FontWeight.w900
                                  )
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
                                  //  hintText: hintText,
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

              //Buy Airtime Button Section
              SizedBox(height: 30,),

              Container(
                height: 40,
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
                      Icons.phone_android,
                      color: Color(0xFFFDF0E9),


                    ),

                    SizedBox(width: 5,),
                    Text(
                      "Buy Airtime - ₦0",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFFFDFCF5),
                        // fontWeight: FontWeight.bold

                      ),
                    )

                  ],
                ),

              )

            ],
          ),
        ),
      ),
    ));
  }
}
