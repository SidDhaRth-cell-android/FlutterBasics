import 'package:flutter/material.dart';
import 'package:flutter09/view/screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late SharedPreferences _sharedPreferences;
  TextEditingController _nameController = TextEditingController();
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(hintText: "Enter name"),
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(hintText: "Enter Email"),
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(hintText: "Password"),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    final name = _nameController.text;
                    final password = _passwordController.text;
                    final email = _emailController.text;
                    _sharedPreferences.setString("user_name", name);
                    _sharedPreferences.setString("user_password", password);
                    _sharedPreferences.setString("user_email", email);

                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => LoginPage()));
                  },
                  child: Text("Registration")),
              TextButton(
                  onPressed: () {},
                  child: Text("Already have an account? Login"))
            ],
          ),
        ),
      ),
    );
  }

  void _initSharedPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
}
