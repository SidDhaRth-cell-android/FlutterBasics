import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int counter = 0;

  void increment() {
    counter = counter + 1;
    notifyListeners();
  }

  void decrement() {
    if (counter != 0) counter = counter - 1;
    notifyListeners();
  }
}
