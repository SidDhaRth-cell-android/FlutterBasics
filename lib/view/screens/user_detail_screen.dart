import 'package:flutter/material.dart';
import 'package:flutter09/model/response/user_list_response.dart';

class UserDetailScreen extends StatefulWidget {
  final UserResponse? user;

  UserDetailScreen(this.user, {super.key});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              foregroundImage: NetworkImage(widget.user?.avatar ?? ''),
              onForegroundImageError: (_, __) {
                Icon(Icons.person);
              },
            ),
            Text("Name ${widget.user?.first_name} ${widget.user?.last_name}"),
            Text("Email ${widget.user?.email}"),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(widget.user?.email);
                },
                child: Text("Hired"))
          ],
        ),
      ),
    );
  }
}
