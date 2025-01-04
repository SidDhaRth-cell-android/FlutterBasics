import 'package:flutter/material.dart';

class ChessBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 80,
                width: 80,
                color: Colors.blue,
                child: Image.network("https://reqres.in/img/faces/7-image.jpg"),
              ),
            )
          ],
        ));
  }


  Widget _stackExample(BuildContext context){
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Stack(
            children: [
              Image.asset("assets/images/2181.jpg"),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, top: 40),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.camera),
                    style: IconButton.styleFrom(
                        backgroundColor: Colors.grey),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: SizedBox(
                    height: 200,
                    width: 200  ,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Colors.white, width: 10)
                      ),
                      child: Icon(
                        Icons.person,
                        size: 100,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
