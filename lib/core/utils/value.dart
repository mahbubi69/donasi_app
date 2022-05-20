// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

String BASE_URL = 'https://317e-180-253-160-19.ngrok.io';

//set token
void prefSetToken(String token) async {
  //shared prefens
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('Token', token);
}

//set id
// ignore: non_constant_identifier_names
void prefSetId(int Id) async {
  //shared prefens
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('Id', Id);
}
