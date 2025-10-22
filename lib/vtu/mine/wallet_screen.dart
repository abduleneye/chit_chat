import 'package:chit_chat/vtu/mine/vtu_ui_components/how_it_works_container.dart';
import 'package:chit_chat/vtu/mine/vtu_ui_components/quick_select_container.dart';
import 'package:chit_chat/vtu/mine/vtu_ui_components/transaction_history_container.dart';
import 'package:chit_chat/vtu/mine/widget_test/custom_seg_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WalletScreen extends StatefulWidget {
  WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  String selected = 'All';

  final List<String> tabs = ['All', 'Credit', 'Debit'];

  List<TransactionHistoryContainer> allTransactionHistory = [
    TransactionHistoryContainer(
      credit: true,
      transactionName: 'Wallet Funding via Bank Transfer',
      transactionDataTime: '2024: 10: 15 09:15 AM',
      transactionAmount: '5,000',
      transactionStatus: 'Completed',
    ),
    TransactionHistoryContainer(
      credit: false,
      transactionName: 'MTN Airtime Purchase',
      transactionDataTime: '2024: 10: 15 09:15 AM',
      transactionAmount: '200',
      transactionStatus: 'Completed',
    ),
    TransactionHistoryContainer(
      credit: true,
      transactionName: 'Wallet Funding via Bank Transfer',
      transactionDataTime: '2024: 10: 15 09:15 AM',
      transactionAmount: '5,000',
      transactionStatus: 'Completed',
    ),
    TransactionHistoryContainer(
      credit: false,
      transactionName: 'MTN Airtime Purchase',
      transactionDataTime: '2024: 10: 15 09:15 AM',
      transactionAmount: '200',
      transactionStatus: 'Completed',
    ),
  ];
  List<TransactionHistoryContainer> get creditTransactionHistory =>
      allTransactionHistory.where((item) => item.credit).toList();
  List<TransactionHistoryContainer> get debitTransactionHistory =>
      allTransactionHistory.where((item) => !item.credit).toList();

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Wallet Section
          Container(
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
                        Text('Wallet',
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
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Available Balance',
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 12)),
                              SizedBox(height: 6),
                              Text('₦2,500.75',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20)),
                            ],
                          ),
                          Icon(
                            Icons.hide_source,
                            size: 16,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Container(
                            height: 40,
                            //width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color(0xFFFDFDF9),
                                borderRadius: BorderRadius.circular(8)),
                            child: const Center(
                              child: Text(
                                "+  Fund",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF8F4CA2),
                                ),
                              ),
                            ),
                          )),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Container(
                            height: 40,
                            //width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color(0xFFA66EB5),
                                borderRadius: BorderRadius.circular(8)),
                            child: const Center(
                              child: Text(
                                "-  Withdraw",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFE7D4EA),
                                ),
                              ),
                            ),
                          )),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
          ),

          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Quick Select Section
                  // const SizedBox(height: 10,),
                  const Text(
                    "Quick Fund",
                    style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF66696F),
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          QuickSelectContainer(amount: '1,000'),
                          QuickSelectContainer(amount: '2,000'),
                          QuickSelectContainer(
                            amount: '5,000',
                          ),
                          QuickSelectContainer(
                            amount: '10,000',
                          )
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  //Transaction History Section
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.history,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Transaction History",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF52545A),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  //History Search Box
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
                              child: Center(
                                child: Icon(
                                  Icons.search,
                                  color: Color(0xFF8B8D91),
                                  size: 30,
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
                                  hintText: "Search transactions",
                                  hintStyle: TextStyle(
                                      fontSize: 17, color: Color(0xFF7E8186))),
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          )
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  //Transaction History Tabs Section
                  const SizedBox(height: 10),
                  // 🔹 The parent container for the "segmented" look
                  Container(
                    height: 40,
                    width: double.infinity,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Color(0xFFFDFDFD),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: tabs.map((tab) {
                        final bool isSelected = selected == tab;
                        return Expanded(
                            child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = tab;
                            });
                          },
                          child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Color(0xFF792D90)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  tab,
                                  style: TextStyle(
                                    color: isSelected
                                        ? Color(0xFFFBFBF7)
                                        : Colors.black87,
                                    fontWeight:
                                        isSelected ? FontWeight.bold : null,
                                  ),
                                ),
                              )),
                        ));
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // 🔹 Tab content area


                  //Transaction History Holder section
                  Container(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, bottom: 20, top: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xFFFDFDFD),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child:  AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: _buildTabContent(selected),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  // Helper to map tab names to index
  Widget _buildTabContent(String tab,) {
    switch (tab) {
      case 'All':
        return  ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 0),
            itemCount: allTransactionHistory.length,
            itemBuilder: (context, index) {
              return TransactionHistoryContainer(
                credit: allTransactionHistory[index].credit,
                transactionName: allTransactionHistory[index].transactionName,
                transactionDataTime: allTransactionHistory[index].transactionDataTime,
                transactionAmount: allTransactionHistory[index].transactionAmount,
                transactionStatus: allTransactionHistory[index].transactionStatus,
                transactionTo: allTransactionHistory[index].transactionTo,
              );
            });
      case 'Credit':
        return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 0),
            itemCount: creditTransactionHistory.length,
            itemBuilder: (context, index) {
              return TransactionHistoryContainer(
                credit: creditTransactionHistory[index].credit,
                transactionName: creditTransactionHistory[index].transactionName,
                transactionDataTime: creditTransactionHistory[index].transactionDataTime,
                transactionAmount: creditTransactionHistory[index].transactionAmount,
                transactionStatus: creditTransactionHistory[index].transactionStatus,
                transactionTo: creditTransactionHistory[index].transactionTo,
              );
            });
      case 'Debit':

        return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 0),
            itemCount: debitTransactionHistory.length,
            itemBuilder: (context, index) {
              return TransactionHistoryContainer(
                credit: debitTransactionHistory[index].credit,
                transactionName: debitTransactionHistory[index].transactionName,
                transactionDataTime: debitTransactionHistory[index].transactionDataTime,
                transactionAmount: debitTransactionHistory[index].transactionAmount,
                transactionStatus: debitTransactionHistory[index].transactionStatus,
                transactionTo: debitTransactionHistory[index].transactionTo,
              );
            });;
      default:
        return const SizedBox();
    }
  }
}
