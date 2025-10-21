import 'package:chit_chat/vtu/mine/vtu_ui_components/electricity_bill_provider_container.dart';
import 'package:chit_chat/vtu/mine/vtu_ui_components/select_bill_category_container.dart';
import 'package:chit_chat/vtu/mine/vtu_ui_components/select_data_plan_Container.dart';
import 'package:chit_chat/vtu/mine/vtu_ui_components/select_network_card_airtime.dart';
import 'package:chit_chat/vtu/mine/vtu_ui_components/select_network_card_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PayBillsScreen extends StatefulWidget {
  PayBillsScreen({super.key});



  @override
  State<PayBillsScreen> createState() => _DataPurchaseScreenState();
}

class _DataPurchaseScreenState extends State<PayBillsScreen> {

  final List<ElectricityBillProviderContainer> electricityBillProviders = [
    ElectricityBillProviderContainer(
        provider: "Eko Electricity (EKEDC)",
        minimumAmount: "100",
        ),
    ElectricityBillProviderContainer(
      provider: "Ikeja Electricity (IKEDC)",
      minimumAmount: "100",
    ),
    ElectricityBillProviderContainer(
      provider: "Power Holding Company",
      minimumAmount: "100",
    ),
    ElectricityBillProviderContainer(
      provider: "Abuja Electricity (AEDC)",
      minimumAmount: "100",
    ),
    ElectricityBillProviderContainer(
      provider: "Kano Electricity (KEDCO)",
      minimumAmount: "100",
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
                                  "Bill Payment",
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
                    // Select Bill Category  Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Select Bill Category",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF9EA0A5),
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SelectBillCategoryContainer(
                              networkName: 'Electricity',
                              iconColor: Color(0xFFF0B34D),
                              billPaymentIcon: Icons.lightbulb,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SelectBillCategoryContainer(
                              networkName: 'Cable TV',
                              iconColor: Color(0xFFB6A7E1),
                              billPaymentIcon: Icons.tv,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SelectBillCategoryContainer(
                                networkName: 'Internet',
                                iconColor: Color(0xFF45A9C3),
                                billPaymentIcon: Icons.wifi,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SelectBillCategoryContainer(
                                networkName: 'Water Bills',
                                iconColor: Color(0xFF6A90C4),
                                billPaymentIcon: Icons.water_drop_outlined,
                              ),
                            ]),

                        const SizedBox(
                          height: 10,
                        ),

                        // Select Provider Section
                        const Text(
                          "Select Provider",
                          style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF74777E),
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
                            itemCount: electricityBillProviders.length,
                            itemBuilder: (context, index){
                              return  ElectricityBillProviderContainer(
                                provider: electricityBillProviders[index].provider,
                                minimumAmount: electricityBillProviders[index].minimumAmount,

                              );
                            }
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),))));
  }
}