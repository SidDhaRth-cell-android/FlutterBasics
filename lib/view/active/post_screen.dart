import 'package:flutter/material.dart';
import 'package:flutter09/vm/user_viewmodel.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  String? _name;
  String? _profession;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("id: ${context.watch<UserViewmodel>().id}"),
              Text("Created At: ${context.watch<UserViewmodel>().createdAt}"),
              TextFormField(
                onChanged: (value) {
                  _name = value;
                },
              ),
              TextFormField(
                onChanged: (value) {
                  _profession = value;
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<UserViewmodel>()
                        .postUserData(_name, _profession);
                  },
                  child: Text("Post data"))
            ],
          ),
        ),
      ),
    );
  }
}
