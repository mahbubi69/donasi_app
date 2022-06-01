import 'package:meta/meta.dart';
import 'dart:convert';

ResponseAddStrukDonasi responseAddStrukDonasiFromJson(String str) =>
    ResponseAddStrukDonasi.fromJson(json.decode(str));

String responseAddStrukDonasiToJson(ResponseAddStrukDonasi data) =>
    json.encode(data.toJson());

class ResponseAddStrukDonasi {
  ResponseAddStrukDonasi({
    required this.data,
    required this.message,
    required this.status,
  });

  final Data? data;
  final String message;
  final int status;

  factory ResponseAddStrukDonasi.fromJson(Map<String, dynamic> json) =>
      ResponseAddStrukDonasi(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"] == null ? null : json["message"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data!.toJson(),
        "message": message == null ? null : message,
        "status": status == null ? null : status,
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
  final String dateDonation;
  final String buktiDonation;
  final int jumlahDonasi;
  final int programId;
  final int userId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        dateDonation:
            json["date_donation"] == null ? null : json["date_donation"],
        buktiDonation:
            json["bukti_donation"] == null ? null : json["bukti_donation"],
        jumlahDonasi:
            json["jumlah_donasi"] == null ? null : json["jumlah_donasi"],
        programId: json["program_id"] == null ? null : json["program_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "date_donation": dateDonation == null ? null : dateDonation,
        "bukti_donation": buktiDonation == null ? null : buktiDonation,
        "jumlah_donasi": jumlahDonasi == null ? null : jumlahDonasi,
        "program_id": programId == null ? null : programId,
        "user_id": userId == null ? null : userId,
      };
}
