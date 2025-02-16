import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter09/models/single_user_response.dart';
import 'package:flutter09/models/users_response.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  SingleUser singleUser = SingleUser();

  Users users = Users();

  void getUserDataFromServer() async {
    final apiResponse =
        await http.get(Uri.parse("https://reqres.in/api/users/2"));
    final jsonResponse = jsonDecode(apiResponse.body);
    singleUser = SingleUser.fromJson(jsonResponse);
    notifyListeners();
  }

  void getMultipleUserFromServer() async {
    final apiResponse =
        await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    final jsonResponse = jsonDecode(apiResponse.body);
    users = Users.fromJson(jsonResponse);
    notifyListeners();
  }
}
