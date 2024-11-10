import 'package:flutter/material.dart';

class LoanDebtBottomSheet extends StatelessWidget {
  LoanDebtBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Loan Application',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'You have an existing loan debt. Please clear the earlier debts first.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "A Key Step Before Taking on New Loans!",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                "Managing debt responsibly is crucial for financial stability. If you're already in debt, lenders may require you to clear existing loans before granting a new one. This process ensures that you maintain a healthy credit score and avoid financial overload. Learn about the importance of paying off current debts, strategies to manage repayments, and how it impacts your ability to qualify for future loans."),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
