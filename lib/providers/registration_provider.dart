import 'package:flutter/material.dart';

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
}
