import 'package:flutter/material.dart';
import 'package:flutter09/view/widgets/custom_button.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class SignBottomSheet extends StatelessWidget {
  Function() onContinue;

  SignBottomSheet({super.key, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Please sign in the grey area.",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                "Your signature going to use to sign this PDF. Your signature is safe with us."),
            SizedBox(
              height: 10,
            ),
            Container(
                height: MediaQuery.of(context).size.width * 0.55,
                child: SfSignaturePad(
                  strokeColor: Colors.blue,
                  minimumStrokeWidth: 1,
                  maximumStrokeWidth: 3,
                  backgroundColor: Colors.grey.withOpacity(0.5),
                )),
            Spacer(),
            CustomButton(onPressed: () {
              Navigator.of(context).pop();
              onContinue.call();
            }),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
