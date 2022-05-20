import 'dart:convert';

import 'package:donasi_app/core/model/profile_model.dart';

ResponseProfileUser responseProfileUseerFromJson(String str) =>
    ResponseProfileUser.fromJson(json.decode(str));

String responseProfileUseerToJson(ResponseProfileUser data) =>
    json.encode(data.toJson());

class ResponseProfileUser {
  ResponseProfileUser({
    required this.data,
    required this.message,
    required this.status,
  });

  Profile data;
  String message;
  int status;

  factory ResponseProfileUser.fromJson(Map<String, dynamic> json) =>
      ResponseProfileUser(
        data: Profile.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "status": status,
      };
}
