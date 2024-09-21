import 'package:flutter/material.dart';
import 'package:flutter09/view/screens/login_page.dart';
import 'package:flutter09/vm/user_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late SharedPreferences _sharedPreferences;

  @override
  void initState() {
    context
        .read<UserViewmodel>()
        .getListOfUsers("https://reqres.in/api/users?page=1");
    _initSharedPref();
    super.initState();
  }

  void _initSharedPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _sharedPreferences.setBool("isLoggedIn", false);
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => LoginPage()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Consumer<UserViewmodel>(
        builder: (BuildContext context, UserViewmodel value, Widget? child) {
          return value.userListResponse.data != null
              ? ListView.builder(
                  itemCount: value.userListResponse.data?.length,
                  itemBuilder: (context, index) {
                    final user = value.userListResponse.data?[index];
                    return ListTile(
                      title: Text("${user?.first_name} ${user?.last_name}"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(user?.email ?? ""),
                          TextButton(
                              onPressed: () {
                                context.read<UserViewmodel>().postUserData(
                                    "https://reqres.in/api/users");
                                /* Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => UserDetailScreen(
                                      userResponse: user,
                                    )));*/
                              },
                              child: Text("Hire Me!"))
                        ],
                      ),
                      leading: Image.network(user?.avatar ?? ""),
                    );
                  })
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
