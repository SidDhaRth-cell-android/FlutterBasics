import 'package:flutter/material.dart';

class DummyScreen extends StatefulWidget {
  const DummyScreen({super.key});

  @override
  State<DummyScreen> createState() => _DummyScreenState();
}

class _DummyScreenState extends State<DummyScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Stack(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                )),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(250))),
                height: 200,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(250))),
                width: 200,
                height: 200,
              ),
            )
          ],
        ),
      ),
    );
  }
}
