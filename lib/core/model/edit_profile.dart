class EditProfile {
  EditProfile({
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

  final int id;
  final String name;
  final String email;
  final String password;
  final String role;
  final String image;
  final String alamat;
  final String jenisKelamin;
  final DateTime tglLahir;
  final String noHp;

  factory EditProfile.fromJson(Map<String, dynamic> json) => EditProfile(
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
        "tgl_lahir":
            "${tglLahir.year.toString().padLeft(4, '0')}-${tglLahir.month.toString().padLeft(2, '0')}-${tglLahir.day.toString().padLeft(2, '0')}",
        "no_hp": noHp,
      };
}
