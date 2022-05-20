class Donasi {
  Donasi({
    required this.id,
    required this.dateDonation,
    required this.buktiDonation,
    required this.programId,
    required this.userId,
  });

  final int id;
  final DateTime dateDonation;
  final String buktiDonation;
  final int programId;
  final int userId;

  factory Donasi.fromJson(Map<String, dynamic> json) => Donasi(
        id: json["id"],
        dateDonation: DateTime.parse(json["date_donation"]),
        buktiDonation: json["bukti_donation"],
        programId: json["program_id"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_donation": dateDonation.toIso8601String(),
        "bukti_donation": buktiDonation,
        "program_id": programId,
        "user_id": userId,
      };
}
