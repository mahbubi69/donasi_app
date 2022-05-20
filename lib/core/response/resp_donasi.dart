import 'package:donasi_app/core/model/model_donasi.dart';
import 'dart:convert';

ResponseDonasi responseFromJson(String str) =>
    ResponseDonasi.fromJson(json.decode(str));

String responseToJson(ResponseDonasi data) => json.encode(data.toJson());

class ResponseDonasi {
  ResponseDonasi({
    required this.data,
    required this.message,
    required this.rowCount,
    required this.status,
  });

  final List<Donasi> data;
  final String message;
  final int rowCount;
  final int status;

  factory ResponseDonasi.fromJson(Map<String, dynamic> json) => ResponseDonasi(
        data: List<Donasi>.from(json["data"].map((x) => Donasi.fromJson(x))),
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
