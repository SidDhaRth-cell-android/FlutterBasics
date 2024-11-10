import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter09/view/loan/dashboard_screen.dart';

class LoaderScreen extends StatefulWidget {
  const LoaderScreen({super.key});

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  bool _isSuccess = false;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    _hitCreditScoringServer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : !_isSuccess
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Something went wrong",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("Issue can be $_errorMessage"),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                _hitCreditScoringServer();
                              },
                              child: Text(
                                "Try Again!",
                                style: TextStyle(color: Colors.white),
                              )),
                        )
                      ],
                    ),
                  )
                : Container(),
      ),
    );
  }

  void _hitCreditScoringServer() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      final response = await Dio()
          .post("http://credit-scoring.dev.kobil.com:3030/loans", data: {
        "user_id": "${creditScoringData.userId}",
        "requested_amount": "${creditScoringData.requestedLoanAmount}",
        "loan_purpose": creditScoringData.loanPurpose,
        "debt_to_income": 18,
        "annual_income": creditScoringData.annualIncome,
        "total_debit_limit": 11100,
        "total_credit_utilized": 38767,
        "current_installment_accounts": 2,
        "total_credit_limit": 28800,
        "accounts_opened_24m": 5,
        "earliest_credit_line": 2001,
        "months_since_last_credit_inquiry": 5
      });
      if (response.statusCode == 200) {
        creditScoringData.isUserHasPreviousCredit =
            response.data["user_has_previous_credit"] as bool;
        creditScoringData.isApproved = response.data["approved"] as bool;
        Navigator.of(context).pop({"status": true});
      } else {
        _errorMessage = response.statusMessage;
      }
    } else {
      _errorMessage = "Please check your internet connection";
    }
    setState(() {});
  }
}
