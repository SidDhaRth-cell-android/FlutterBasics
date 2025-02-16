import 'package:flutter/material.dart';
import 'package:flutter09/insta_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  SharedPreferences? sharedPreferences;

  bool _isToggled = false;
  double _sliderValue = 0.5;

  List<String> fruitsName = ["apple", "banana", "mango", "orange", "pineapple"];

  List<Widget> pages = [Shop(), Profile(), Reels(), Search()];

  @override
  void initState() {
    _initializeSharedPreference();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Future.delayed(Duration(seconds: 2), () {
                    sharedPreferences?.setBool("is_logged_in", false);
                  });
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: Container(
          color: Colors.blue,
            child: Image.asset("assets/images/2181.jpg", height: MediaQuery.of(context).size.height * 0.5,)));
  }

  Widget getGridViewExample() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 8),
        itemCount: 100,
        itemBuilder: (context, index) {
          return Card(
            elevation: 20,
            child: ListTile(
              title: Text("Item ${index + 1}"),
              onTap: () {},
            ),
            color: Colors.blue,
          );
        });
  }

  Widget getListViewExample() {
    return ListView.builder(
        itemCount: fruitsName.length, //4
        itemBuilder: (context, index) {
          // 0 // 1 // 2 // 3
          final fruitName = fruitsName[index];
          return ListTile(
            title: Text(fruitName),
            subtitle: Text("This is my subtitle"),
            leading: Text("${index + 1}."),
          );
        });
  }

  void _initializeSharedPreference() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {});
  }
}
