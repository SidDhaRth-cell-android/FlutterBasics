import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Registration Page",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 48,
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "Enter your name",
                    labelText: "Your name",
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 48,
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "Enter your email",
                    labelText: "Your email",
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 48,
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "Enter your password",
                    labelText: "Password",
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 48,
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "Enter your confirm password",
                    labelText: "Confirm Password",
                    border: OutlineInputBorder()),
              ),
            ),
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                Text("Terms & Conditions")
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {},
                  child: Text("Sign Up"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue
                  ),),
            )
          ],
        ),
      ),
    );
  }
}
