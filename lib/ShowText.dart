import 'package:flutter/material.dart';
import 'package:flutter09/providers/user_provider.dart';
import 'package:flutter09/user_details.dart';
import 'package:provider/provider.dart';

class ShowText extends StatefulWidget {
  const ShowText({super.key});

  @override
  State<ShowText> createState() => _ShowTextState();
}

class _ShowTextState extends State<ShowText> {
  @override
  void initState() {
    context.read<UserProvider>().getMultipleUserFromServer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Consumer<UserProvider>(
            builder: (BuildContext context, UserProvider value, Widget? child) {
              return value.users.data != null
                  ? ListView.builder(
                      itemCount: value.users.data?.length,
                      itemBuilder: (context, index) {
                        final user = value.users.data?[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => UserDetails(userData: user,)));
                          },
                          child: ListTile(
                            title: Text("${user?.firstName} ${user?.lastName}"),
                            subtitle: Text(user?.email ?? "NA"),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(user?.avatar ?? ""),
                            ),
                          ),
                        );
                      })
                  : CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
