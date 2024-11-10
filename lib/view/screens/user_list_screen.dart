import 'package:flutter/material.dart';
import 'package:flutter09/view/screens/user_detail_screen.dart';
import 'package:flutter09/vm/user_viewmodel.dart';
import 'package:provider/provider.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  void initState() {
    context
        .read<UserViewmodel>()
        .getListOfUsers("https://reqres.in/api/users?page=1");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<UserViewmodel>(
        builder: (BuildContext context, UserViewmodel value, Widget? child) {
          return value.userListResponse.data != null
              ? Column(
                  children: [
                    TextFormField(
                      onChanged: (data) {
                        value.updateList(data);
                      },
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: value.userListResponse.data?.length,
                          itemBuilder: (context, index) {
                            final user = value.userListResponse.data?[index];
                            return ListTile(
                              title: Text(
                                  "${user?.first_name} ${user?.last_name}"),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(user?.email ?? ""),
                                  TextButton(
                                      onPressed: () async {
                                        final email = await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    UserDetailScreen(user)));
                                        context
                                            .read<UserViewmodel>()
                                            .updateHireMe(email);
                                      },
                                      child: Text(user?.isHired == true
                                          ? "Hired"
                                          : "Hire me!"))
                                ],
                              ),
                              leading: Image.network(user?.avatar ?? ""),
                            );
                          }),
                    ),
                  ],
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
