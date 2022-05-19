import 'dart:convert';

class Profile {
  Profile({
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

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
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
