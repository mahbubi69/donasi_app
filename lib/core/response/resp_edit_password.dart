import 'package:donasi_app/core/model/edit_password.dart';
import 'dart:convert';

ResponseEditPassword responseEditPasswordFromJson(String str) =>
    ResponseEditPassword.fromJson(json.decode(str));

String responseEditPasswordToJson(ResponseEditPassword data) =>
    json.encode(data.toJson());

class ResponseEditPassword {
  ResponseEditPassword({
    required this.message,
    required this.status,
    required this.data,
  });

  final String message;
  final int status;
  final EditPassword data;

  factory ResponseEditPassword.fromJson(Map<String, dynamic> json) =>
      ResponseEditPassword(
        message: json["Message"],
        status: json["Status"],
        data: EditPassword.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "Message": message,
        "Status": status,
        "data": data.toJson(),
      };
}
