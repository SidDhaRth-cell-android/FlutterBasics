import 'package:flutter/material.dart';
import 'package:flutter09/model/repo/user_repo.dart';
import 'package:flutter09/model/request/user_request.dart';
import 'package:flutter09/model/response/user_list_response.dart';

class UserViewmodel extends ChangeNotifier {
  UserListResponse _userListResponse = UserListResponse();

  UserListResponse get userListResponse => _userListResponse;

  UserRepo _userRepo = UserRepo();

  Future<void> getListOfUsers(String url) async {
    _userListResponse = await _userRepo.getUserList(url);
    /* final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      _userListResponse = UserListResponse.fromJson(jsonResponse);
    }*/
    notifyListeners();
  }

  Future<void> postUserData(String url) async {
    final userRequest = UserRequest();
    userRequest.name = "Siddharth";
    userRequest.job = "Android Developer";
    final response = await _userRepo.postUserData(url, userRequest);
    print(response.toJson());
  }
}
