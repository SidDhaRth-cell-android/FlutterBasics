import 'package:flutter/material.dart';
import 'package:flutter09/view/screens/accounts_screen.dart';
import 'package:flutter09/view/screens/my_card_screen.dart';
import 'package:flutter09/view/screens/transactions_screen.dart';
import 'package:flutter09/view/widgets/credit_card_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.settings_overscan_sharp)),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => MyCardScreen()));
            },
            icon: Icon(Icons.contact_mail_outlined),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => InvestAccountScreen()));
            },
            icon: Icon(Icons.person_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Payment Cards",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(left: 20, right: index == 2 ? 20 : 0),
                      child: CreditCardWidget(
                        isFromHomeScreen: true,
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "Exchange rates",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 110,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(left: 20, right: index == 2 ? 20 : 0),
                      child: _getExchangeRateContainer(context),
                    );
                  }),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "Transactions",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => TransactionsScreen()));
                      },
                      icon: Icon(Icons.arrow_forward_ios))
                ],
              ),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return _getTransactionTile();
                })
          ],
        ),
      ),
    );
  }

  Widget _getTransactionTile() {
    return ListTile(
      title: Text(
        "Car loans",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text("9:01am"),
      leading: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.pinkAccent,
        ),
        child: Icon(
          Icons.car_crash_sharp,
          color: Colors.white,
        ),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "\$13.10",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text("-4.5%",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _getExchangeRateContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "AUD",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            "\$0.8",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(
                "0.03 (4.5%)",
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(Icons.trending_up)
            ],
          ),
        ],
      ),
    );
  }
}
