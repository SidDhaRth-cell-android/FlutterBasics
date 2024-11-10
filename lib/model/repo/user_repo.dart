import 'dart:convert';

import 'package:flutter09/model/request/user_request.dart';
import 'package:flutter09/model/response/user_add_response.dart';
import 'package:flutter09/model/response/user_list_response.dart';
import 'package:flutter09/model/services/user_service.dart';

class UserRepo {
  UserService userService = UserService();

  Future<UserListResponse> getUserList(String url) async {
    final response = await userService.get(url);
    return UserListResponse.fromJson(jsonDecode(response)); // json
  }

  Future<UserAddResponse> postUserData(
      String url, UserRequest userRequest) async {
    final response = await userService.post(url, userRequest.toJson());
    return UserAddResponse.fromJson(jsonDecode(response));
  }
}
