import 'package:flutter/material.dart';
import 'package:flutter09/view/screens/registration_page.dart';
import 'package:flutter09/view/screens/user_list_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late SharedPreferences _sharedPreferences;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _initSharedPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(hintText: "Enter email"),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(hintText: "Enter password"),
            ),
            ElevatedButton(
                onPressed: () {
                  final enteredEmail = _emailController.text;
                  final enteredPassword = _passwordController.text;
                  final storedEmail =
                      _sharedPreferences.getString("user_email");
                  final storedPassword =
                      _sharedPreferences.getString("user_password");
                  if (enteredEmail != storedEmail) {
                    print("Wrong email entered");
                  } else if (enteredPassword != storedPassword) {
                    print("Wrong password entered");
                  } else {
                    _sharedPreferences.setBool("isLoggedIn", true);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => UserListScreen()));
                  }
                },
                child: Text("Login")),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => RegistrationPage()));
                },
                child: Text("Don't have an account? Register."))
          ],
        ),
      ),
    );
  }

  void _initSharedPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
}
