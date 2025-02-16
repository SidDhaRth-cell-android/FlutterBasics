import 'package:flutter/material.dart';
import 'package:flutter09/models/users_response.dart';

class UserDetails extends StatefulWidget {
  final Data? userData;

  const UserDetails({super.key, this.userData});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(widget.userData?.avatar ?? ""),
            Text("${widget.userData?.firstName} ${widget.userData?.lastName}"),
            Text("${widget.userData?.email}"),
          ],
        ),
      ),
    );
  }
}
