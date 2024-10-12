import 'package:flutter/material.dart';
import 'package:flutter09/view/loan/dashboard_screen.dart';

class LoanAmountScreen extends StatefulWidget {
  const LoanAmountScreen({super.key});

  @override
  State<LoanAmountScreen> createState() => _LoanAmountScreenState();
}

class _LoanAmountScreenState extends State<LoanAmountScreen> {
  TextEditingController _loanAmountController = TextEditingController();

  @override
  void initState() {
    if (creditScoringData.requestedLoanAmount != null)
      _loanAmountController.text =
          creditScoringData.requestedLoanAmount.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Enter Loan Amount Requested",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _loanAmountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Loan Amount",
                    labelText: "Loan Amount"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Annual Income is mandatory";
                  }
                  return null;
                },
                onChanged: (value) {
                  creditScoringData.requestedLoanAmount = int.parse(value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
