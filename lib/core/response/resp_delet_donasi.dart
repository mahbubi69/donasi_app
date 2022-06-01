import 'dart:convert';

ResponseDeletDonasi responseDeletDonasiFromJson(String str) =>
    ResponseDeletDonasi.fromJson(json.decode(str));

String responseDeletDonasiToJson(ResponseDeletDonasi data) =>
    json.encode(data.toJson());

class ResponseDeletDonasi {
  ResponseDeletDonasi({
    required this.status,
    required this.message,
  });

  final int status;
  final String message;

  factory ResponseDeletDonasi.fromJson(Map<String, dynamic> json) =>
      ResponseDeletDonasi(
        status: json["Status"] == null ? 0 : json["Status"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status == null ? null : status,
        "message": message == null ? null : message,
      };
}
