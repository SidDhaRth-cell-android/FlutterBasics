import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter09/view/screens/google_maps.dart';
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
      FirebaseCrashlytics.instance.crash();
      if (_sharedPreferences.getBool("isLoggedIn") == true) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => GoogleMaps()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => GoogleMaps()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  void _initSharedPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
}
