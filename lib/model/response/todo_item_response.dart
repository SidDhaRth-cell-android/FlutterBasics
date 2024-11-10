/// userId : 1
/// id : 1
/// title : "delectus aut autem"
/// completed : false

class TodoItemResponse {
  TodoItemResponse({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) {
    _userId = userId;
    _id = id;
    _title = title;
    _completed = completed;
  }

  TodoItemResponse.fromJson(dynamic json) {
    _userId = json['userId'];
    _id = json['id'];
    _title = json['title'];
    _completed = json['completed'];
  }

  int? _userId;
  int? _id;
  String? _title;
  bool? _completed;

  TodoItemResponse copyWith({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) =>
      TodoItemResponse(
        userId: userId ?? _userId,
        id: id ?? _id,
        title: title ?? _title,
        completed: completed ?? _completed,
      );

  int? get userId => _userId;

  int? get id => _id;

  String? get title => _title;

  bool? get completed => _completed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['id'] = _id;
    map['title'] = _title;
    map['completed'] = _completed;
    return map;
  }
}
