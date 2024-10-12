import 'package:flutter/material.dart';
import 'package:flutter09/view/loan/dashboard_screen.dart';

class LoanPurposeScreen extends StatelessWidget {
  Function(String)? onPurposeSelected;

  LoanPurposeScreen({super.key, this.onPurposeSelected});

  final loanPurposes = <LoanPurpose>[
    LoanPurpose("Car", Icons.car_repair_sharp, "car"),
    LoanPurpose("Credit Card", Icons.credit_card, "credit_card"),
    LoanPurpose(
        "Debt Consolidation", Icons.monetization_on, "debt_consolidation"),
    LoanPurpose("Home Improvement", Icons.home_work, "home_improvement"),
    LoanPurpose("House", Icons.house, "house"),
    LoanPurpose("Major Purchase", Icons.money_sharp, "major_purchase"),
    LoanPurpose("Medical", Icons.medical_information, "medical"),
    LoanPurpose("Moving", Icons.moving, "moving"),
    LoanPurpose("Renewable Energy", Icons.energy_savings_leaf_outlined,
        "renewable_energy"),
    LoanPurpose("Small Business", Icons.business, "small_business"),
    LoanPurpose("Vacation", Icons.settings_accessibility_sharp, "vacation"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Select Loan Purpose",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 50),
                    itemCount: loanPurposes.length,
                    itemBuilder: (context, index) {
                      final loanPurpose = loanPurposes[index];
                      return InkWell(
                        onTap: () {
                          creditScoringData.loanPurpose = loanPurpose.id;
                          onPurposeSelected?.call(loanPurpose.name);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          color: Colors.red,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                loanPurpose.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              Icon(
                                size: 30,
                                loanPurpose.icon,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

class LoanPurpose {
  String name;
  IconData icon;
  String id;

  LoanPurpose(this.name, this.icon, this.id);
}
