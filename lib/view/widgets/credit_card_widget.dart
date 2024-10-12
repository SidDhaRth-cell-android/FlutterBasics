import 'package:flutter/material.dart';

class CreditCardWidget extends StatelessWidget {
  bool isFromHomeScreen;

  CreditCardWidget({super.key, this.isFromHomeScreen = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isFromHomeScreen ? MediaQuery.of(context).size.width * 0.8 : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.black, Colors.red],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.credit_card,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(height: 16),
            Text(
              "Card Number",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "3141 5926 5358 9793",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            isFromHomeScreen
                ? Spacer()
                : SizedBox(
                    height: 50,
                  ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cardholder Name",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "John Doe",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      "Expiration",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "06/22",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
