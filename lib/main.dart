import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter09/chess_board.dart';
import 'package:flutter09/locked_profile.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChessBoard(),
    );
  }
}

class TextWidget extends StatefulWidget {
  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/behaviour_icon.png"),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Enter email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Enter password",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value?.isEmpty == true || value!.length < 6) {
                  return "Password must be at least 6 characters";
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    final password = _emailController.text;
                    if (password?.isEmpty == true || password!.length < 6) {
                      print("Password must be at least 6 characters");
                    }
                    // hitApi();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text(
                    "Log in",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        )),
      ),
    );
  }
}
