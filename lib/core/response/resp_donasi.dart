import 'dart:convert';

import '../model/model_donasi.dart';

ResponseProgram responseProgramFromJson(String str) =>
    ResponseProgram.fromJson(json.decode(str));

String responseProgramToJson(ResponseProgram data) =>
    json.encode(data.toJson());

class ResponseProgram {
  ResponseProgram({
    required this.data,
    required this.message,
    required this.rowCount,
    required this.status,
  });

  List<Program> data;
  String message;
  int rowCount;
  int status;

  factory ResponseProgram.fromJson(Map<String, dynamic> json) =>
      ResponseProgram(
        data: List<Program>.from(json["data"].map((x) => Program.fromJson(x))),
        message: json["message"],
        rowCount: json["rowCount"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "rowCount": rowCount,
        "status": status,
      };
}
