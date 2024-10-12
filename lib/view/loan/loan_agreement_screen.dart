import 'package:flutter/material.dart';
import 'package:flutter09/view/loan/payment_screen.dart';
import 'package:flutter09/view/loan/sign_bottom_sheet.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class LoanAgreementScreen extends StatelessWidget {
  const LoanAgreementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isDismissible: false,
              builder: (context) {
                return SignBottomSheet(
                  onContinue: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => PaymentScreen()));
                  },
                );
              });
        },
        backgroundColor: Colors.blue,
        isExtended: true,
        icon: Icon(
          Icons.type_specimen_outlined,
          color: Colors.white,
        ),
        label: Text(
          "Sign It",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(child: SfPdfViewer.asset("assets/loan_agreement.pdf")),
        ],
      ),
    );
  }
}
