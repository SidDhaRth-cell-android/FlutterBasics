import 'package:flutter/material.dart';
import 'package:flutter09/model/response/user_list_response.dart';

class UserDetailScreen extends StatelessWidget {
  final UserResponse? userResponse;

  const UserDetailScreen({super.key, required this.userResponse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(userResponse?.avatar ?? ""),
            Text(
                "Name: ${userResponse?.first_name} ${userResponse?.last_name}"),
            Text("Email: ${userResponse?.email}")
          ],
        ),
      ),
    );
  }
}
