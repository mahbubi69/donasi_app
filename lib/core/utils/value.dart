// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

String BASE_URL = 'https://8a1c-180-253-164-18.ngrok.io';

//set token
void prefSetToken(String token) async {
  //shared prefens
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('Token', token);
}

//st id
// ignore: non_constant_identifier_names
void prefSetId(int Id) async {
  //shared prefens
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('Id', Id);
}
