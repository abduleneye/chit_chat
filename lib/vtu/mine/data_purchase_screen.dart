import 'package:chit_chat/vtu/mine/vtu_ui_components/select_network_card_airtime.dart';
import 'package:chit_chat/vtu/mine/vtu_ui_components/select_network_card_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DataPurchaseScreen extends StatefulWidget {
  const DataPurchaseScreen({super.key});

  @override
  State<DataPurchaseScreen> createState() => _DataPurchaseScreenState();
}

class _DataPurchaseScreenState extends State<DataPurchaseScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFFFDFDFD),
        ),
        child: Scaffold(
          backgroundColor: Color(0xFFFDFDFD),
            appBar: PreferredSize(
                preferredSize:
                    const Size.fromHeight(80), // 👈 10% of screen height
                child: Container(
                  // height: size.height * 0.35,
                  //margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding: const EdgeInsets.only(
                      top: 40, left: 10, right: 10, bottom: 25),
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
                            fontWeight: FontWeight.w600),
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
                ],
              ),
            ))));
  }
}
