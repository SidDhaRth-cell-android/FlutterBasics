import 'package:flutter/material.dart';
import 'package:flutter09/model/repo/todo_repository.dart';
import 'package:flutter09/model/response/todo_item_response.dart';

class TodoProvider extends ChangeNotifier {
  TodoRepository _repository = TodoRepository();

  TodoItemResponse _itemResponse = TodoItemResponse();

  TodoItemResponse get itemResponse => _itemResponse;
  String? errorMessage;

  Future<void> getTodoItem() async {
    final response = await _repository.getTodoItem();
    print("TODO PROVIDER ====================> ${response}");
    final status = response["status"] as bool;
    if (status) {
      _itemResponse = response["body"] as TodoItemResponse;
    } else {
      errorMessage = response["message"];
    }
    notifyListeners();
  }
}
