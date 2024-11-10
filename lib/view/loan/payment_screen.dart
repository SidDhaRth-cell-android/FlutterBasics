import 'package:flutter/material.dart';
import 'package:flutter09/view/loan/dashboard_screen.dart';
import 'package:flutter09/view/loan/payment_done_screen.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Payment Option'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select your payment method:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "You're eligible to pay through kobil pay",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Total Amount: \$${creditScoringData.requestedLoanAmount}"),
            Text(
                "Amount will be paid by Kobil Pay: \$${creditScoringData.requestedLoanAmount}"),
            if (creditScoringData.isApproved &&
                !creditScoringData.isUserHasPreviousCredit)
              PaymentOptionCard(
                icon: Icons.monetization_on_outlined,
                title: 'Pay using Kobil Pay',
                onTap: () {
                  _navigateToPaymentSuccessful(context);
                },
              ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Other payment method:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Credit/Debit Card Option
            PaymentOptionCard(
              icon: Icons.credit_card,
              title: 'Credit/Debit Card',
              onTap: () {
                // Navigate to card payment screen
              },
            ),
            // UPI Option
            PaymentOptionCard(
              icon: Icons.account_balance_wallet,
              title: 'UPI',
              onTap: () {
                // Navigate to UPI payment screen
              },
            ),
            // Net Banking Option
            PaymentOptionCard(
              icon: Icons.account_balance,
              title: 'Net Banking',
              onTap: () {
                // Navigate to net banking screen
              },
            ),
            // Wallet Option
            PaymentOptionCard(
              icon: Icons.wallet_giftcard,
              title: 'Wallets',
              onTap: () {
                // Navigate to wallet payment screen
              },
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToPaymentSuccessful(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => PaymentDoneScreen()));
  }
}

class PaymentOptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  PaymentOptionCard({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(
          icon,
          size: 30,
          color: Colors.white,
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
        onTap: onTap,
      ),
    );
  }
}
