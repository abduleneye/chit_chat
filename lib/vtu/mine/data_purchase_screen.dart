import 'package:chit_chat/vtu/mine/vtu_ui_components/select_data_plan_Container.dart';
import 'package:chit_chat/vtu/mine/vtu_ui_components/select_network_card_airtime.dart';
import 'package:chit_chat/vtu/mine/vtu_ui_components/select_network_card_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DataPurchaseScreen extends StatefulWidget {
   DataPurchaseScreen({super.key});



  @override
  State<DataPurchaseScreen> createState() => _DataPurchaseScreenState();
}

class _DataPurchaseScreenState extends State<DataPurchaseScreen> {
  final List<SelectDataPlanContainer> dataCatalogue = [
    SelectDataPlanContainer(gigAmount: "1", validityPeriod: "30", price: "350"),
    SelectDataPlanContainer(gigAmount: "2", validityPeriod: "30", price: "700"),
    SelectDataPlanContainer(gigAmount: "3", validityPeriod: "30", price: "1050"),
    SelectDataPlanContainer(gigAmount: "5", validityPeriod: "30", price: "1750"),
    SelectDataPlanContainer(gigAmount: "10", validityPeriod: "30", price: "3500"),
    SelectDataPlanContainer(gigAmount: "15", validityPeriod: "30", price: "5250"),

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
                                  "Data Purchase",
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
                child: Column(
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
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SelectNetworkCardData(
                              networkName: 'MTN',
                              wifiIconColor: Color(0xFFF6D062),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SelectNetworkCardData(
                              networkName: 'Airtel',
                              wifiIconColor: Color(0xFFD77885),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SelectNetworkCardData(
                                networkName: 'Glo',
                                wifiIconColor: Color(0xFFB1F3D5),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SelectNetworkCardData(
                                networkName: '9mobile',
                                wifiIconColor: Color(0xFFB1F3D5),
                              ),
                            ])
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    // Select Data Plan Section
                    const Text(
                      "Select Data Plan",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF32353B),
                          fontWeight: FontWeight.w500),
                    ),
                    //
                    const SizedBox(
                      height: 5,
                    ),
                    //Data Selection Expanded Column
                    ListView.builder(
                      shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(vertical: 0),
                        itemCount: dataCatalogue.length,
                        itemBuilder: (context, index){
                          return  SelectDataPlanContainer(
                            gigAmount: dataCatalogue[index].gigAmount,
                            validityPeriod: dataCatalogue[index].validityPeriod,
                            price: dataCatalogue[index].price,
                          );
                        }
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
                            border: Border.all(
                              width: 2,
                              color: Color(0xFFEBEBEE),

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
                                      color: Color(0xFFF3ECF6)),
                                  child: Center(
                                    child:Center(
                                      child: Icon(
                                        Icons.person,
                                        color: Color(0xFFB59ABC),
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
                                        hintText: "e.g, 08012345678",
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
                    SizedBox(height: 10,),
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
                            Icons.wifi,
                            color: Color(0xFFFDF0E9),


                          ),

                          SizedBox(width: 5,),
                          Text(
                            "Purchase Data",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFFDFCF5),
                              // fontWeight: FontWeight.bold

                            ),
                          )

                        ],
                      ),

                    ),
                    SizedBox(height: 30,),





                  ],
                ),
              ),
            )));
  }
}
