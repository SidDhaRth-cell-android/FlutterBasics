import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
                onPressed: () async {
                  launchUrlString("tel://9625283528");
                  /*final Email email = Email(
                    body: 'Email body',
                    subject: 'Email subject',
                    recipients: ['example@example.com'],
                    cc: ['cc@example.com'],
                    bcc: ['bcc@example.com'],
                    isHTML: false,
                  );
                  await FlutterEmailSender.send(email);*/
                },
                child: Text("Send an email"))));
  }
}
