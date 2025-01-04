import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  SharedPreferences? sharedPreferences;

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
      body: Center(
        child: sharedPreferences != null
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      "First Name: ${sharedPreferences?.getString("first_name")}"),
                  Text("Email: ${sharedPreferences?.getString("email")}"),
                  Text("Password: ${sharedPreferences?.getString("password")}"),
                  Text(
                      "Phone number: ${sharedPreferences?.getString("phone_number")}"),
                ],
              )
            : CircularProgressIndicator(),
      ),
    );
  }

  void _initializeSharedPreference() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {});
  }
}
