import 'dart:convert';

import 'package:donasi_app/core/response/resp_edit_profile.dart';
import 'package:donasi_app/core/response/resp_login_user.dart';
import 'package:donasi_app/core/response/resp_register_user.dart';
import 'package:donasi_app/core/utils/value.dart';
import 'package:http/http.dart' as http;

class ServiceUser {
  //login
  Future<ResponseLogin> loginUserService(
    final String email,
    password,
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
    email,
    password,
    role,
    image,
    alamat,
    jenisKelamin,
    tanggalLahir,
    noHp,
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

//get profile
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
  Future<dynamic> getProgramService(String token) async {
    var response =
        await http.get(Uri.parse('$BASE_URL/api/getAllProgram'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'token': '$token',
    });
    if (response.statusCode == 200) {
      var itemProgram = json.decode(response.body);
      print('item program : $itemProgram');
      return itemProgram;
    } else {
      print('not connected to rest api');
    }
  }

  //edit profile
  Future<ResponseEditProfile> editProfileService(
    String nama,
    alamat,
    tanggalLahir,
    noHp,
    id,
    token,
  ) async {
    var response = await http.put(Uri.parse('$BASE_URL/api/editProfile/$id'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'token': '$token',
        },
        body: jsonEncode(<String, String>{
          'name': nama,
          'alamat': alamat,
          'tgl_lahir': tanggalLahir,
          'no_hp': noHp,
        }));
    var responsEditProfile = json.decode(response.body);
    return ResponseEditProfile.fromJson(responsEditProfile);
  }

// get donasi
  Future<dynamic> getReportDonasiService(String token) async {
    var response = await http.get(
      Uri.parse('$BASE_URL/api/getDonasi'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'token': '$token',
      },
    );
    if (response.statusCode == 200) {
      var itemProgram = json.decode(response.body);
      print('item program  : $itemProgram');
      return itemProgram;
    } else {
      print('not connected api');
    }
  }
}
