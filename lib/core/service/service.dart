import 'dart:convert';

import 'package:donasi_app/core/response/resp_login_user.dart';
import 'package:donasi_app/core/response/resp_register_user.dart';
import 'package:donasi_app/core/utils/value.dart';
import 'package:http/http.dart' as http;

class ServiceUser {
  //login user
  Future<ResponseLogin> loginUserServic(
    final String email,
    final String password,
  ) async {
    var response = await http.post(
      Uri.parse('$BASE_URL/api/loginUser'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        // 'Content-type': 'application/json',
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
        'nama': nama,
        'email': email,
        'password': password,
        'role': role,
        'alamat': alamat,
        'jenisKelamin': jenisKelamin,
        'tanggalLahir': tanggalLahir,
        'noHp': noHp,
      }),
    );
    var reponseRegister = json.decode(reponse.body);
    return ResponseRegister.fromJson(reponseRegister);
  }
}

//profile

