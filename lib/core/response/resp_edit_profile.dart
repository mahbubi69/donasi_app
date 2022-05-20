import 'package:donasi_app/core/model/edit_profile.dart';
import 'dart:convert';

ResponseEditProfile reponseEditProfileFromJson(String str) =>
    ResponseEditProfile.fromJson(json.decode(str));

String reponseEditProfileToJson(ResponseEditProfile data) =>
    json.encode(data.toJson());

class ResponseEditProfile {
  ResponseEditProfile({
    required this.message,
    required this.status,
    required this.data,
  });

  final String message;
  final int status;
  final EditProfile data;

  factory ResponseEditProfile.fromJson(Map<String, dynamic> json) =>
      ResponseEditProfile(
        message: json["Message"],
        status: json["Status"],
        data: EditProfile.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "Message": message,
        "Status": status,
        "data": data.toJson(),
      };
}
