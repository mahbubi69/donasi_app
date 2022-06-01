import 'package:donasi_app/core/model/model_donasi.dart';
import 'dart:convert';

ResponseReportDonasi responseFromJson(String str) =>
    ResponseReportDonasi.fromJson(json.decode(str));

String responseToJson(ResponseReportDonasi data) => json.encode(data.toJson());

class ResponseReportDonasi {
  ResponseReportDonasi({
    required this.data,
    required this.message,
    required this.rowCount,
    required this.status,
  });

  final List<Donasi> data;
  final String message;
  final int rowCount;
  final int status;

  factory ResponseReportDonasi.fromJson(Map<String, dynamic> json) => ResponseReportDonasi(
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
