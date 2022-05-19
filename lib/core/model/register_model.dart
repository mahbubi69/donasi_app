import 'dart:convert';

class Register {
  Register({
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
  DateTime? tglLahir;
  String noHp;

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        role: json["role"] == null ? null : json["role"],
        image: json["image"] == null ? null : json["image"],
        alamat: json["alamat"] == null ? null : json["alamat"],
        jenisKelamin: json["jenis_kelamin"],
        tglLahir: json["tgl_lahir"] == null
            ? null
            : DateTime.parse(json["tgl_lahir"]),
        noHp: json["no_hp"] == null ? null : json["no_hp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "role": role == null ? null : role,
        "image": image == null ? null : image,
        "alamat": alamat == null ? null : alamat,
        "jenis_kelamin": jenisKelamin == null ? null : jenisKelamin,
        "tgl_lahir": tglLahir == null ? null : tglLahir!.toIso8601String(),
        "no_hp": noHp == null ? null : noHp,
      };
}
