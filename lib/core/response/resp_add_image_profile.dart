import 'package:donasi_app/core/model/add_image_profile.dart';
import 'dart:convert';

ResponseEditImageProfile responseEditPasswordFromJson(String str) =>
    ResponseEditImageProfile.fromJson(json.decode(str));

String responseEditPasswordToJson(ResponseEditImageProfile data) =>
    json.encode(data.toJson());

class ResponseEditImageProfile {
  var token;

  ResponseEditImageProfile({
    required this.message,
    required this.status,
    required this.data,
  });

  final String? message;
  final int? status;
  final AddImageProfile data;

  factory ResponseEditImageProfile.fromJson(Map<String, dynamic> json) =>
      ResponseEditImageProfile(
        message: json["Message"],
        status: json["Status"],
        data: AddImageProfile.fromJson(json["data"]),
      );
  Map<String, dynamic> toJson() => {
        "Message": message,
        "Status": status,
        "data": data.toJson(),
      };
}
