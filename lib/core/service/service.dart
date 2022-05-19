import 'dart:convert';

import 'package:donasi_app/core/model/register_model.dart';
import 'package:donasi_app/core/response/resp_login_user.dart';
import 'package:donasi_app/core/response/resp_register_user.dart';
import 'package:donasi_app/core/utils/value.dart';
import 'package:http/http.dart' as http;

class ServiceUser {
  //login user
  Future<ResponseLogin> loginUserService(
    final String email,
    final String password,
  ) async {
    var response = await http.post(
      Uri.parse('$BASE_URL/api/loginUser'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
    var responLogin = json.decode(response.body);
    return ResponseLogin.fromJson(responLogin);
  }

//register
  Future<ResponseRegister> registerUser(
    final String nama,
    final String email,
    final String password,
    final String role,
    final String image,
    final String alamat,
    final String jenisKelamin,
    final String tanggalLahir,
    final String noHp,
  ) async {
    var reponse = await http.post(
      Uri.parse('$BASE_URL/api/registerUser'),
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'name': nama,
        'email': email,
        'password': password,
        'role': role,
        'image': image,
        'alamat': alamat,
        'jenis_kelamin': jenisKelamin,
        'tgl_lahir': tanggalLahir,
        'no_hp': noHp,
      }),
    );
    var reponseRegister = json.decode(reponse.body);
    return ResponseRegister.fromJson(reponseRegister);
  }
}

//profile
Future<dynamic> getProfileService(int id, String token) async {
  var response =
      await http.get(Uri.parse('$BASE_URL/api/getUserId/$id'), headers: {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'token': '$token',
  });

  // ignore: unrelated_type_equality_checks
  if (response.statusCode == 200) {
    var itemProfile = json.decode(response.body);
    print('profile : $itemProfile');
    return itemProfile;
  } else {
    print('not connected to rest api');
  }
}

//get program
Future<dynamic> getProgramService() async {
  var response = await http.get(Uri.parse('$BASE_URL/api/getAllProgram'));
  if (response.statusCode == 200) {
    var itemDonasi = json.decode(response.body);
    print('item Donasi : $itemDonasi');
    return itemDonasi;
  } else {
    print('not connected to rest api');
  }
}
