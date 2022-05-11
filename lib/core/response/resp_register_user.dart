import 'dart:convert';

ResponseRegister responseRegisterFromJson(String str) =>
    ResponseRegister.fromJson(json.decode(str));

String responseRegisterToJson(ResponseRegister data) =>
    json.encode(data.toJson());

class ResponseRegister {
  ResponseRegister({
    required this.data,
    required this.message,
    required this.status,
  });

  Data data;
  String message;
  int status;

  factory ResponseRegister.fromJson(Map<String, dynamic> json) =>
      ResponseRegister(
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
  String alamat;
  String jenisKelamin;
  String tglLahir;
  String noHp;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        role: json["role"],
        alamat: json["alamat"],
        jenisKelamin: json["jenis_kelamin"],
        tglLahir: json["tgl_lahir"],
        noHp: json["no_hp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "role": role,
        "alamat": alamat,
        "jenis_kelamin": jenisKelamin,
        "tgl_lahir": tglLahir,
        "no_hp": noHp,
      };
}
