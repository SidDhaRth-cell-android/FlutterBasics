import 'package:http/http.dart' as http;

class TodoService {
  Future<http.Response> getTodoItem() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/todos/1"));
    print("TODO SERVICE ====================> ${response.body}");
    return response;
  }
}
