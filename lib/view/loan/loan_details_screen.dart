import 'package:flutter/material.dart';
import 'package:flutter09/view/loan/dashboard_screen.dart';

class LoanDetailsScreen extends StatelessWidget {
  LoanDetailsScreen({super.key});

  List<LoanDetailsModel> detailsModelList = [
    LoanDetailsModel("Loan Purpose", creditScoringData.loanPurpose),
    LoanDetailsModel("Debt To Income", "18"),
    LoanDetailsModel("Annual Income", "40,000"),
    LoanDetailsModel("Total Debit Limit", "11100"),
    LoanDetailsModel("Total Credit Utilized", "38767"),
    LoanDetailsModel("Current Installment Accounts", "2"),
    LoanDetailsModel("Total Credit Limit", "28800"),
    LoanDetailsModel("Accounts Opened 24m", "5"),
    LoanDetailsModel("Earliest Credit Line", "2001"),
    LoanDetailsModel("Months Since Last Credit Inquiry", "5"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Approval Status: ",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      creditScoringData.isApproved ? "Approved" : "Rejected",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: creditScoringData.isApproved
                              ? Colors.green
                              : Colors.red),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      "Request Amount: ",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "\$${creditScoringData.requestedLoanAmount}",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Loaned Amount: ",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "\$${creditScoringData.predictedLoanAmount}",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                    "Your loan got rejected but you still can choose other options to pay."),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: detailsModelList.length,
                    itemBuilder: (context, index) {
                      final detailModel = detailsModelList[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            detailModel.key ?? "",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Container(
                            child: Text(
                              detailModel.value ?? "",
                              style: TextStyle(fontSize: 14),
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 10),
                          )
                        ],
                      );
                    }),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoanDetailsModel {
  String? key;
  String? value;

  LoanDetailsModel(this.key, this.value);
}
