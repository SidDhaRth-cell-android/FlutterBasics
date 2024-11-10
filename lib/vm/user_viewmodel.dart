import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter09/model/repo/user_repo.dart';
import 'package:flutter09/model/response/single_user_response.dart';
import 'package:flutter09/model/response/user_list_response.dart';
import 'package:http/http.dart' as http;

class UserViewmodel extends ChangeNotifier {
  UserListResponse _userListResponse = UserListResponse();

  UserListResponse get userListResponse => _userListResponse;

  UserRepo _userRepo = UserRepo();

  Future<void> getListOfUsers(String url) async {
    //_userListResponse = await _userRepo.getUserList(url);
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      _userListResponse = UserListResponse.fromJson(jsonResponse);
    }
    notifyListeners();
  }

  List<UserResponse> filteredList = [];

  void updateHireMe(String email) {
    _userListResponse.data?.forEach((element) {
      if (element.email == email) {
        element.isHired = true;
      }
    });
    notifyListeners();
  }

  void updateList(String value) {
    filteredList.clear();
    _userListResponse.data?.forEach((element) {
      if (element.first_name?.toLowerCase().contains(value.toLowerCase()) ==
          true) {
        filteredList.add(element);
      }
    });
    notifyListeners();
  }

  void deleteUser() async {
    //   final serverRequest = SingleUserRequest("Siddharth", "Software Developer");
    final response = await http.delete(
      Uri.parse("https://reqres.in/api/users/2"),
    );
    print(response.statusCode);
  }

  SingleUserResponse singleUserResponse = SingleUserResponse();

  // SingleUserResponse get singleUserResponse => _singleUserResponse;

  Future<void> getSingleUser() async {
    final response = await http.get(Uri.parse("https://reqres.in/api/users/2"));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      singleUserResponse = SingleUserResponse.fromJson(jsonResponse);
    }

    notifyListeners();
  }

  String? id;
  String? createdAt;

  Future<void> postUserData(String? name, String? profession) async {
    SingleUserRequest singleUserRequest = SingleUserRequest(name, profession);
    final response = await http.post(Uri.parse("https://reqres.in/api/users"),
        body: singleUserRequest.toJson());
    if (response.statusCode == 201) {
      final jsonResponse = jsonDecode(response.body);
      id = jsonResponse["id"];
      createdAt = jsonResponse["createdAt"];
    }
    notifyListeners();
    /*final userRequest = UserRequest();
    userRequest.name = "Siddharth";
    userRequest.job = "Android Developer";
    final response = await _userRepo.postUserData(url, userRequest);
    print(response.toJson());*/
  }
}

class SingleUserRequest {
  String? name;
  String? job;

  SingleUserRequest(this.name, this.job);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name;
    data["job"] = this.job;
    return data;
  }
}
