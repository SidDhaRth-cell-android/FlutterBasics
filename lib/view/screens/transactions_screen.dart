import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Transactions",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.currency_exchange),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none),
          )
        ],
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.history)),
      ),
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 15,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return _getTransactionTile();
          }),
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
        child: Icon(Icons.car_crash_sharp),
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
}
