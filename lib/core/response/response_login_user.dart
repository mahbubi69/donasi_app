import 'package:meta/meta.dart';
import 'dart:convert';

ResponseLoginUser ResponseLoginUserFromJson(String str) =>
    ResponseLoginUser.fromJson(json.decode(str));

String ResponseLoginUserToJson(ResponseLoginUser data) =>
    json.encode(data.toJson());

class ResponseLoginUser {
  ResponseLoginUser({
    required this.data,
    required this.status,
    required this.token,
  });

  Data data;
  String status;
  String token;

  factory ResponseLoginUser.fromJson(Map<String, dynamic> json) =>
      ResponseLoginUser(
        data: Data.fromJson(json["data"]),
        status: json["status"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "status": status,
        "token": token,
      };
}

class Data {
  Data({
    required this.id,
    required this.nama,
    required this.email,
    required this.password,
  });

  int id;
  String nama;
  String email;
  String password;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        nama: json["nama"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "email": email,
        "password": password,
      };
}
