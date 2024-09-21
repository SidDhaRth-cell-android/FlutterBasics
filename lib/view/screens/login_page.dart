import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(),
            TextField(),
            ElevatedButton(onPressed: () {}, child: Text("Login")),
            TextButton(
                onPressed: () {},
                child: Text("Don't have an account? Register."))
          ],
        ),
      ),
    );
  }
}
