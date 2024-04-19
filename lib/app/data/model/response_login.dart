/// status : 200
/// message : "Login sukses"
/// data : {"id":5,"token":"77|cd2xQL5q3dJMGQaCO7GFU51xrTi6Di1GShm7LrFB99e5daa3","name":"pannz","password":"$2y$12$9FpBhJs.Y1ibpZ0xQp8gQuwvI.1j0mWGjJ.UNNrejv2eA5XrywpqS"}

class ResponseLogin {
  ResponseLogin({
      this.status, 
      this.message, 
      this.data,});

  ResponseLogin.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// id : 5
/// token : "77|cd2xQL5q3dJMGQaCO7GFU51xrTi6Di1GShm7LrFB99e5daa3"
/// name : "pannz"
/// password : "$2y$12$9FpBhJs.Y1ibpZ0xQp8gQuwvI.1j0mWGjJ.UNNrejv2eA5XrywpqS"

class Data {
  Data({
      this.id, 
      this.token, 
      this.name, 
      this.password,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    token = json['token'];
    name = json['name'];
    password = json['password'];
  }
  int? id;
  String? token;
  String? name;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['token'] = token;
    map['name'] = name;
    map['password'] = password;
    return map;
  }

}