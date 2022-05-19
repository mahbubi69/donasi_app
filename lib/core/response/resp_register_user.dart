import 'package:meta/meta.dart';
import 'dart:convert';

import '../model/register_model.dart';

ResponseRegister ResponseRegisterFromJson(String str) =>
    ResponseRegister.fromJson(json.decode(str));

String ResponseRegisterToJson(ResponseRegister data) =>
    json.encode(data.toJson());

class ResponseRegister {
  ResponseRegister({
    required this.data,
    required this.message,
    required this.status,
  });

  Register? data;
  String message;
  int status;

  factory ResponseRegister.fromJson(Map<String, dynamic> json) =>
      ResponseRegister(
        data: json["data"] == null ? null : Register.fromJson(json["data"]),
        message: json["message"] == null ? null : json["message"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data!.toJson(),
        "message": message == null ? null : message,
        "status": status == null ? null : status,
      };
}
