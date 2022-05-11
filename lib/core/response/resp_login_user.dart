import 'dart:convert';

ResponseLogin responseLoginFromJson(String str) =>
    ResponseLogin.fromJson(json.decode(str));

String responseLoginToJson(ResponseLogin data) => json.encode(data.toJson());

class ResponseLogin {
  ResponseLogin({
    required this.data,
    required this.message,
    required this.status,
    required this.token,
  });

  final Data? data;
  final String message;
  final int status;
  final String? token;

  factory ResponseLogin.fromJson(Map<String, dynamic> json) => ResponseLogin(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
        token: json["token"] == null ? null : json["token"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data!.toJson(),
        "message": message,
        "status": status,
        "token": token == null ? null : token,
      };
}

class Data {
  Data({
    required this.id,
    required this.nama,
    required this.email,
    required this.password,
    required this.role,
  });

  int id;
  String nama;
  String email;
  String password;
  String role;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        nama: json["nama"] == null ? null : json["nama"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        role: json["role"] == null ? null : json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nama": nama == null ? null : nama,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "role": role == null ? null : role,
      };
}
