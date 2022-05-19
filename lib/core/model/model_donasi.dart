import 'dart:convert';

class Program {
  Program({
    required this.id,
    required this.banner,
    required this.title,
    required this.story,
    required this.incomingDonation,
  });

  int id;
  String banner;
  String title;
  String story;
  String incomingDonation;

  factory Program.fromJson(Map<String, dynamic> json) => Program(
        id: json["id"],
        banner: json["banner"],
        title: json["title"],
        story: json["Story"],
        incomingDonation: json["IncomingDonation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "banner": banner,
        "title": title,
        "Story": story,
        "IncomingDonation": incomingDonation,
      };
}
