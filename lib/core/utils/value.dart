import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: non_constant_identifier_namess
String BASE_URL = 'https://c3f0-180-246-187-95.ngrok.io';

final storage = FlutterSecureStorage();

Object writeSecureData(String key, String value) {
  var writeData = storage.write(key: key, value: value);
  return writeData;
}

//shared prefens
void sharedPrefendLoginStatus(bool status) async {
  //shared prefens
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('loginStatus', status);
}

//set token
void sharedPrefendSetToken(String token) async {
  //shared prefens
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('StatusToken', token);
}

//set id
void sharedPrefendSetId(int id) async {
  //shared prefens
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('StatusId', id);
}

// //get id
// void sharedPrefendGetId(int id) async {
//   //shared prefens
//   final prefs = await SharedPreferences.getInstance();
//   prefs.getInt('StatusId', id);
// }

//get token
void sharedPrefendGetToken() async {
  //shared prefens
  final prefs = await SharedPreferences.getInstance();
  prefs.getString('StatusToken');
}
