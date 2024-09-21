class UserListResponse {
  int? page;
  int? per_page;
  int? total;
  int? total_pages;
  List<UserResponse>? data;
  Support? support;

  UserListResponse();

  UserListResponse.fromJson(Map<String, dynamic> json) {
    this.page = json["page"];
    this.per_page = json["per_page"];
    this.total = json["total"];
    this.total_pages = json["total_pages"];
    if (json['data'] != null) {
      data = <UserResponse>[];
      json['data'].forEach((v) {
        data?.add(new UserResponse.fromJson(v));
      });
    }
    this.support = json["support"]!=null ? Support.fromJson(json["support"]) : null;
  }
}

class UserResponse {
  int? id;
  String? email;
  String? first_name;
  String? last_name;
  String? avatar;

  UserResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    first_name = json['first_name'];
    last_name = json['last_name'];
    avatar = json['avatar'];
  }
}

class Support {
  String? url;
  String? text;

  Support.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    text = json['text'];
  }
}
