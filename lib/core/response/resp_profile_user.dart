import 'dart:convert';

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

  Data data;
  String message;
  int status;

  factory ResponseProfileUser.fromJson(Map<String, dynamic> json) =>
      ResponseProfileUser(
        data: Data.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "status": status,
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
        image: json["image"] == null ? null : json["image"],
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
        "image": image == null ? null : image,
        "alamat": alamat,
        "jenis_kelamin": jenisKelamin,
        "tgl_lahir": tglLahir.toIso8601String(),
        "no_hp": noHp,
      };
}
