class Program {
  Program({
    required this.id,
    required this.banner,
    required this.namaPanti,
    required this.deskripsi,
    required this.lokasi,
    required this.kontak,
    required this.nomorRekening,
    required this.incomingDonation,
  });

  final int id;
  final String banner;
  final String namaPanti;
  final String deskripsi;
  final String lokasi;
  final String kontak;
  final String nomorRekening;
  final String incomingDonation;

  factory Program.fromJson(Map<String, dynamic> json) => Program(
        id: json["id"],
        banner: json["banner"],
        namaPanti: json["nama_panti"],
        deskripsi: json["deskripsi"],
        lokasi: json["lokasi"],
        kontak: json["kontak"],
        nomorRekening: json["nomor_rekening"],
        incomingDonation: json["target_donation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "banner": banner,
        "nama_panti": namaPanti,
        "deskripsi": deskripsi,
        "lokasi": lokasi,
        "kontak": kontak,
        "nomor_rekening": nomorRekening,
        "incoming_donation": incomingDonation,
      };
}
