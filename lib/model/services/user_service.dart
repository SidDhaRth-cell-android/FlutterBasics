import 'package:flutter09/model/services/base_service.dart';
import 'package:http/http.dart' as http;

class UserService extends BaseService {
  @override
  Future<dynamic> get(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      // Successful
      if (response.statusCode == 200) {
        return response.body;
      }
      return {"error": response.statusCode, "message": response.reasonPhrase};
    } catch (ex) {
      return {"error": ex.toString(), "message": "Something went wrong"};
    }
  }

  @override
  post(String url, Object data) async {
    try {
      final response = await http.post(Uri.parse(url), body: data);
      // Successful
      if (response.statusCode == 201) {
        return response.body;
      }
    } catch (ex) {
      return {"error": ex.toString(), "message": "Something went wrong"};
    }
  }
}
