
import 'package:flutter/material.dart';

class ChessBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(child: Container(height: 50,  color: Colors.black,)),
              Expanded(child: Stack(children: [
                Container(height: 50, color: Colors.white,),
                Image.asset("assets/images/oonth.png")
              ],)),
              Expanded(child: Container(height: 50,  color: Colors.black,)),
              Expanded(child: Container(height: 50, color: Colors.white,)),
              Expanded(child: Container(height: 50,  color: Colors.black,)),
              Expanded(child: Container(height: 50, color: Colors.white,)),
              Expanded(child: Container(height: 50,  color: Colors.black,)),
              Expanded(child: Container(height: 50, color: Colors.white,)),
            ],
          ),
          Row(
            children: [
              Expanded(child: Container(height: 50, color: Colors.white,)),
              Expanded(child: Container(height: 50,  color: Colors.black,)),
              Expanded(child: Container(height: 50, color: Colors.white,)),
              Expanded(child: Container(height: 50,  color: Colors.black,)),
              Expanded(child: Container(height: 50, color: Colors.white,)),
              Expanded(child: Container(height: 50,  color: Colors.black,)),
              Expanded(child: Container(height: 50, color: Colors.white,)),
              Expanded(child: Container(height: 50,  color: Colors.black,)),

            ],
          )
        ],
      ),
    );
  }

}