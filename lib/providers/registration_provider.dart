import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter09/models/register_response.dart';
import 'package:flutter09/models/requests/register_request.dart';
import 'package:http/http.dart' as http;

class RegistrationProvider extends ChangeNotifier {
  bool isChecked = false;

  void toggleCheckBox(bool value) {
    isChecked = value;
    notifyListeners();
  }

  bool checkIfToggleEnabled() {
    return isChecked;
  }

  bool isPasswordShown = false;

  void handlePasswordVisibility() {
    isPasswordShown = !isPasswordShown;
    notifyListeners();
  }

  RegisterResponse registerResponse = RegisterResponse();
  bool isLoading = false;
  String? errorMessage;


  void showLoader(){
    isLoading = true;
    notifyListeners();
  }

  void dismissLoader(){
    isLoading = false;
    notifyListeners();
  }

  Future<void> registerUser(RegisterRequest registerRequest) async {
    showLoader();

    final response = await http.post(Uri.parse("https://reqres.in/api/users"),
        body: registerRequest.toJson());

    if (response.statusCode == 201) {
      dismissLoader();
      final bodyString = response.body;
      final jsonResponse = jsonDecode(bodyString);
      registerResponse = RegisterResponse.fromJson(jsonResponse);
      print(registerResponse);
    } else {
      errorMessage = response.reasonPhrase;
      print(errorMessage);
      dismissLoader();
    }
    notifyListeners();
  }
}
