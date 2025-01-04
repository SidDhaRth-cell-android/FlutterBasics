import 'package:flutter/material.dart';
import 'package:flutter09/dashboard_screen.dart';
import 'package:flutter09/registration_form.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  final int? counter;

  const LoginForm({super.key, this.counter});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late SharedPreferences _sharedPreferences;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    initializeSharedPreference();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.close,
                color: Colors.black,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Sign In ${widget.counter}",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 30,
              ),
              Text("Email"),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Enter email"),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Password"),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Enter password"),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    final storedEmail = _sharedPreferences.getString("email");
                    final storedPassword =
                        _sharedPreferences.getString("password");

                    if (email == storedEmail && password == storedPassword) {
                      _sharedPreferences.setBool("is_logged_in", true);
                      Fluttertoast.showToast(msg: "Authenticated Successfully");
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DashboardScreen()));
                      });
                    } else {
                      Fluttertoast.showToast(msg: "Invalid email or password");
                    }
                  },
                  child: Text(
                    "Log In",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationForm()));
                      },
                      child: Text("Don't have an account? Register"))),
            ],
          ),
        ),
      ),
    );
  }

  void initializeSharedPreference() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
}
