import 'dart:convert';

ResponseDeletImageProfile responseDeletImageFromJson(String str) =>
    ResponseDeletImageProfile.fromJson(json.decode(str));

String responseDeletImageToJson(ResponseDeletImageProfile data) =>
    json.encode(data.toJson());

class ResponseDeletImageProfile {
  ResponseDeletImageProfile({
    required this.status,
    required this.data,
    required this.message,
  });

  int status;
  Data data;
  String message;

  factory ResponseDeletImageProfile.fromJson(Map<String, dynamic> json) =>
      ResponseDeletImageProfile(
        status: json["Status"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    required this.image,
    required this.alamat,
    required this.jenisKelamin,
    required this.tglLahir,
    required this.noHp,
  });

  int id;
  String name;
  String email;
  String password;
  String role;
  String image;
  String alamat;
  String jenisKelamin;
  DateTime tglLahir;
  String noHp;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        role: json["role"],
        image: json["image"],
        alamat: json["alamat"],
        jenisKelamin: json["jenis_kelamin"],
        tglLahir: DateTime.parse(json["tgl_lahir"]),
        noHp: json["no_hp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "role": role,
        "image": image,
        "alamat": alamat,
        "jenis_kelamin": jenisKelamin,
        "tgl_lahir": tglLahir.toIso8601String(),
        "no_hp": noHp,
      };
}
