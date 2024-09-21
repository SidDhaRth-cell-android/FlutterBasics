abstract class BaseService {
  Future<dynamic> get(String url);

  dynamic post(String url, Object data);

/* dynamic put(String url);

  dynamic delete(String url);*/
}
