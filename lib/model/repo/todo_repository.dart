import 'dart:convert';

import 'package:flutter09/model/response/todo_item_response.dart';
import 'package:flutter09/model/services/todo_service.dart';

class TodoRepository {
  TodoService _service = TodoService();

  Future<dynamic> getTodoItem() async {
    try {
      final response = await _service.getTodoItem();
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print("TODO REPOSITORY SUCCESS ====================> ${jsonResponse}");
        return {
          "status": true,
          "message": "Data fetched successfully",
          "body": TodoItemResponse.fromJson(jsonResponse)
        };
      } else {
        print(
            "TODO REPOSITORY FAILURE ====================> ${response.reasonPhrase}");
        return {
          "status": false,
          "message": response.reasonPhrase,
          "body": null
        };
      }
    } catch (ex) {
      print("TODO REPOSITORY EXCEPTION ====================> ${ex.toString()}");
      return {"status": false, "message": ex.toString(), "body": null};
    }
  }
}
