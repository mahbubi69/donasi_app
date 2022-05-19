import 'dart:convert';

class Login {
  Login({
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

  factory Login.fromJson(Map<String, dynamic> json) => Login(
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
