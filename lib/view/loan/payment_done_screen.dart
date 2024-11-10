import 'package:flutter/material.dart';
import 'package:flutter09/view/widgets/custom_button.dart';

class PaymentDoneScreen extends StatefulWidget {
  const PaymentDoneScreen({Key? key}) : super(key: key);

  @override
  State<PaymentDoneScreen> createState() => _PaymentDoneScreenState();
}

class _PaymentDoneScreenState extends State<PaymentDoneScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment Confirmation",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/success.png",
                  color: Colors.blue,
                ),
                Icon(
                  Icons.check,
                  size: 32,
                  color: Colors.white,
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Payment Successfully",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Total Amount Paid by Kobil Pay",
              style: TextStyle(color: Colors.blue),
            ),
            Text(
              "Please help us with our product reviews",
              style: TextStyle(color: Colors.blue),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Laptop",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                                fontWeight: FontWeight.w300),
                          ),
                          Spacer(),
                          Text(
                            "\$99.00",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            "Laptop",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                                fontWeight: FontWeight.w300),
                          ),
                          Spacer(),
                          Text(
                            "\$99.00",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            "Laptop",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                                fontWeight: FontWeight.w300),
                          ),
                          Spacer(),
                          Text(
                            "\$99.00",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.blue,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            "\$297.00",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(onPressed: () {}),
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
