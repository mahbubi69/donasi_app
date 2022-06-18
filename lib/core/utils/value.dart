import 'package:shared_preferences/shared_preferences.dart';

// String BASE_URL = 'https://dev.donasi.jelajahin.com/';

String BASE_URL = 'https://dev.donasi.jelajahin.com';

//set token
void prefSetToken(String token) async {
  //shared prefens
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('Token', token);
}

void prefSetId(int id) async {
  //shared prefens
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('Id', id);
}

//set program id
// ignore: non_constant_identifier_names
void prefSetIdProgram(int idProgram) async {
  //shared prefens
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('IdProgram', idProgram);
}

//set donasi id
// ignore: non_constant_identifier_names
void prefSetIdDonasi(int idDonasi) async {
  //shared prefens
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('IdDonasi', idDonasi);
}
