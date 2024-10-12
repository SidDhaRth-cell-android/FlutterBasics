import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  String? buttonName;

  CustomButton({super.key, required this.onPressed, this.buttonName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: Colors.blue),
            onPressed: onPressed,
            child: Text(
              buttonName ?? "Continue",
              style: TextStyle(color: Colors.white, fontSize: 16),
            )));
  }
}
