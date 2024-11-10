import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter09/vm/user_viewmodel.dart';
import 'package:provider/provider.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  late UserViewmodel _userViewmodel;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((callback){
      _userViewmodel = Provider.of<UserViewmodel>(context, listen: false);
      _userViewmodel.getSingleUser();
    });
   // Future.delayed(Duration(seconds: 5), (){

   // });
    //Future.microtask(() {

    //});
    // context.read<UserViewmodel>().getSingleUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _userViewmodel = Provider.of<UserViewmodel>(context, listen: false);
    final user = _userViewmodel.singleUserResponse.data;
    return Scaffold(
      body: _userViewmodel.singleUserResponse.data != null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text("${user?.firstName} ${user?.lastName}"),
                    subtitle: Text(user?.email ?? ""),
                    leading: Image.network(user?.avatar ?? ""),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<UserViewmodel>().postUserData("","");
                      },
                      child: Text("POST CALL"))
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
