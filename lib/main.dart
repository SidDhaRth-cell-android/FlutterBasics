import 'package:flutter/material.dart';
import 'package:flutter09/ShowText.dart';
import 'package:flutter09/counter_screen.dart';
import 'package:flutter09/dashboard_screen.dart';
import 'package:flutter09/insta_page.dart';
import 'package:flutter09/providers/counter_provider.dart';
import 'package:flutter09/providers/registration_provider.dart';
import 'package:flutter09/providers/user_provider.dart';
import 'package:flutter09/registration_form.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => CounterProvider()),
    ChangeNotifierProvider(create: (_) => RegistrationProvider()),
    ChangeNotifierProvider(create: (_) => UserProvider())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegistrationForm(),
    );
  }
}




