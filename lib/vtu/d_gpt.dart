import 'package:flutter/material.dart';

class DashboardScreeng extends StatelessWidget {
  Widget _serviceCard(BuildContext context, IconData icon, String title, String subtitle) {
    final double radius = 12;
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0,4))],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 26, color: Theme.of(context).primaryColor),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.w700)),
                SizedBox(height: 4),
                Text(subtitle, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final purple = Theme.of(context).primaryColor;
    final size = MediaQuery.of(context).size;
    final double topPadding = MediaQuery.of(context).padding.top + 16;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Purple header card
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(20, topPadding, 20, 24),
              decoration: BoxDecoration(
                color: purple,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Good evening', style: TextStyle(color: Colors.white70, fontSize: 12)),
                          SizedBox(height: 6),
                          Text('User 👋', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 20)),
                        ],
                      ),
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white,
                        child: Text('T', style: TextStyle(color: purple, fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                  SizedBox(height: 18),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: purple.withOpacity(0.85),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.white.withOpacity(.06)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Wallet Balance', style: TextStyle(color: Colors.white70, fontSize: 12)),
                              SizedBox(height: 6),
                              Text('₦2,500.75', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 20)),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: purple,
                            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {},
                          child: Text('+ Fund Wallet'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // promo banner
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.redAccent.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text('🎉 Recharge & Get 5% Cashback!  Valid until Dec 31st', style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 18),
                  Text('Services', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                  SizedBox(height: 12),
                  GridView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 92,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    children: [
                      _serviceCard(context, Icons.phone_android, 'Buy Airtime', 'Top up your phone'),
                      _serviceCard(context, Icons.wifi, 'Buy Data', 'Internet bundles'),
                      _serviceCard(context, Icons.flash_on, 'Pay Bills', 'Electricity, TV, etc.'),
                      _serviceCard(context, Icons.sports_esports, 'Fund Betting', 'Sports betting'),
                    ],
                  ),

                  SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Recent Transactions', style: TextStyle(fontWeight: FontWeight.w800)),
                      Text('View All', style: TextStyle(color: Theme.of(context).primaryColor)),
                    ],
                  ),
                  SizedBox(height: 12),

                  // sample transaction list
                  Column(
                    children: [
                      _txItem(Icons.arrow_downward, 'Wallet Funding via Bank Transfer', '+₦5,000', 'Completed', context),
                      _txItem(Icons.arrow_upward, 'MTN Airtime Purchase', '-₦200', 'Completed', context),
                      _txItem(Icons.arrow_upward, 'Airtel Data Bundle - 2GB', '-₦1,500', 'Completed', context),
                    ],
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _txItem(IconData icon, String title, String amount, String status, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0,4))],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey.shade100,
            child: Icon(icon, color: Theme.of(context).primaryColor),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.w700)),
                SizedBox(height: 4),
                Text('2024-10-15 10:30 AM', style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(amount, style: TextStyle(fontWeight: FontWeight.bold, color: amount.startsWith('+') ? Colors.green : Colors.red)),
              SizedBox(height: 6),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(status, style: TextStyle(color: Colors.green.shade800, fontSize: 11)),
              )
            ],
          )
        ],
      ),
    );
  }
}
