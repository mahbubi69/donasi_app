// To parse this JSON data, do
//
//     final responseDonasi = responseDonasiFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ResponseDonasi responseDonasiFromJson(String str) =>
    ResponseDonasi.fromJson(json.decode(str));

String responseDonasiToJson(ResponseDonasi data) => json.encode(data.toJson());

class ResponseDonasi {
  ResponseDonasi({
    required this.data,
    required this.message,
    required this.status,
  });

  final Data? data;
  final String message;
  final int status;

  factory ResponseDonasi.fromJson(Map<String, dynamic> json) => ResponseDonasi(
        data: Data?.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "message": message,
        "status": status,
      };
}

class Data {
  Data({
    required this.id,
    required this.dateDonation,
    required this.buktiDonation,
    required this.jumlahDonasi,
    required this.programId,
    required this.userId,
  });

  final int id;
  final DateTime dateDonation;
  final String buktiDonation;
  final int jumlahDonasi;
  final int programId;
  final int userId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        dateDonation: DateTime.parse(json["date_donation"]),
        buktiDonation: json["bukti_donation"]?.isEmpty,
        jumlahDonasi: json["jumlah_donasi"],
        programId: json["program_id"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_donation":
            "${dateDonation.year.toString().padLeft(4, '0')}-${dateDonation.month.toString().padLeft(2, '0')}-${dateDonation.day.toString().padLeft(2, '0')}",
        "bukti_donation": buktiDonation == null ? null : buktiDonation,
        "jumlah_donasi": jumlahDonasi,
        "program_id": programId,
        "user_id": userId,
      };
}
