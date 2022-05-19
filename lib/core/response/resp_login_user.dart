import 'dart:convert';

import '../model/login_model.dart';

ResponseLogin responseLoginFromJson(String str) =>
    ResponseLogin.fromJson(json.decode(str));

String responseLoginToJson(ResponseLogin data) => json.encode(data.toJson());

class ResponseLogin {
  ResponseLogin({
    required this.data,
    required this.message,
    required this.status,
    required this.token,
  });

  final Login? data;
  final String message;
  final int status;
  final String? token;

  factory ResponseLogin.fromJson(Map<String, dynamic> json) => ResponseLogin(
        data: json["data"] == null ? null : Login.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
        token: json["token"] == null ? null : json["token"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data!.toJson(),
        "message": message,
        "status": status,
        "token": token == null ? null : token,
      };
}
