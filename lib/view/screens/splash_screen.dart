import 'package:flutter/material.dart';
import 'package:flutter09/view/screens/login_page.dart';
import 'package:flutter09/view/screens/user_list_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences _sharedPreferences;

  @override
  void initState() {
    super.initState();
    _initSharedPref();
    Future.delayed(Duration(milliseconds: 1500), () {
      if (_sharedPreferences.getBool("isLoggedIn") == true) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => UserListScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => LoginPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

  void _initSharedPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
}
