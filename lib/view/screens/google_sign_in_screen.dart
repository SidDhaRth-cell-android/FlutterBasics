import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter09/view/screens/payment_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInScreen extends StatefulWidget {
  const GoogleSignInScreen({super.key});

  @override
  State<GoogleSignInScreen> createState() => _GoogleSignInScreenState();
}

class _GoogleSignInScreenState extends State<GoogleSignInScreen> {
  final _googleSignIn = GoogleSignIn();

  @override
  void initState() {
    _initFirebaseMessaging();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () {
              _handleSignIn();
            },
            child: TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: false,
                      context: context,
                      builder: (context) {
                        return Material(child: PaymentScreen());
                      });
                },
                child: Text("Open Item from Bottom")),
          ),
        ),
      ),
    );
  }

  void _handleSignIn() async {
    final googleAccount = await _googleSignIn.signIn();
    print(googleAccount?.displayName);
    print(googleAccount?.email);
    // SSO -> Social Sign On
    // Manual form -> Time consuming
    print(googleAccount?.photoUrl);
  }

  void _initFirebaseMessaging() async {
    final token = await FirebaseMessaging.instance.getToken();
    print("FIREBASE CLOUD MESSAGING TOKEN $token");
  }
}
