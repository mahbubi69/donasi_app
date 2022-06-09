import 'dart:convert';
import 'dart:io';

import 'package:donasi_app/core/response/resp_add_image_profile.dart';
import 'package:donasi_app/core/response/resp_add_struck_donasi.dart';
import 'package:donasi_app/core/response/resp_delet_donasi.dart';
import 'package:donasi_app/core/response/resp_delet_image_profile.dart';
import 'package:donasi_app/core/response/resp_add_donasi.dart';
import 'package:donasi_app/core/response/resp_edit_password.dart';
import 'package:donasi_app/core/response/resp_edit_profile.dart';
import 'package:donasi_app/core/response/resp_login_user.dart';
import 'package:donasi_app/core/response/resp_register_user.dart';
import 'package:donasi_app/core/utils/value.dart';
import 'package:flutter/services.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:path/path.dart';

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
    var response = await http.post(
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
    var reponseRegister = json.decode(response.body);
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
    String token,
  ) async {
    var response = await http.put(
      Uri.parse('$BASE_URL/api/editProfile/$id'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'token': '$token',
      },
      body: jsonEncode(
        <String, String>{
          'name': nama,
          'alamat': alamat,
          'tgl_lahir': tanggalLahir,
          'no_hp': noHp,
        },
      ),
    );
    var responsEditProfile = json.decode(response.body);
    return ResponseEditProfile.fromJson(responsEditProfile);
  }

// get donasi
  Future<dynamic> getReportDonasiService(
    String token,
    int id,
  ) async {
    var response = await http.get(
      Uri.parse('$BASE_URL/api/getToIduserDonasi/$id'),
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

//edit password
  Future<ResponseEditPassword> editPasswordService(
    String token,
    id,
    password,
  ) async {
    var response = await http.put(Uri.parse('$BASE_URL/api/editPassword/$id'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'token': '$token',
        },
        body: jsonEncode(
          <String, String>{
            'password': password,
          },
        ));
    var responseEditPassword = json.decode(response.body);
    return ResponseEditPassword.fromJson(responseEditPassword);
  }

  //add image profile
  Future<ResponseEditImageProfile> editProfileImagSrvice(
    String token,
    int id,
    File? fileImage,
  ) async {
    var stream = http.ByteStream(fileImage!.openRead());
    Map<String, String> headers = {"token": '$token'};
    var fileLength = await fileImage.length();
    var uri = Uri.parse('$BASE_URL/api/addImageUser/$id');
    var request = await http.MultipartRequest("PUT", uri);
    request.files.add(http.MultipartFile('image', stream, fileLength,
        filename: fileImage.path));
    request.headers.addAll(headers);
    var streamResponse = await request.send();
    var parseResponse = await http.Response.fromStream(streamResponse);
    var responseJson = json.decode(parseResponse.body);
    return ResponseEditImageProfile.fromJson(responseJson);
  }

  //delet img profile
  Future<ResponseEditImageProfile> deletProfileImageService(
    String token,
    id,
    String title,
    File? fileImage,
  ) async {
    Map<String, String> headers = {"token": '$token'};
    var uri = Uri.parse('$BASE_URL/api/addImageUser/$id');
    var request = await http.MultipartRequest("PUT", uri);
    var picture = http.MultipartFile.fromBytes(
        'image',
        (await rootBundle.load('assets/icon/icon_user.png'))
            .buffer
            .asUint8List(),
        filename: 'icon_user.png');
    request.headers.addAll(headers);
    request.files.add(picture);

    var streamResponse = await request.send();
    var parseResponse = await http.Response.fromStream(streamResponse);
    var responseJson = json.decode(parseResponse.body);
    return ResponseEditImageProfile.fromJson(responseJson);
  }

//add donasi
  Future<ResponseAddDonasi> addDonasiService(
    int jumlahDonasi,
    idProgram,
    idUser,
    String token,
  ) async {
    var response = await http.post(Uri.parse('$BASE_URL/api/addDonasi'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'token': '$token'
        },
        body: jsonEncode(
          <String, int>{
            "jumlah_donasi": jumlahDonasi,
            "program_id": idProgram,
            "user_id": idUser
          },
        ));
    var responseDonasi = json.decode(response.body);
    return ResponseAddDonasi.fromJson(responseDonasi);
  }

  //delet donasi
  Future<ResponseDeletDonasi> deletDonasiService(
    int id,
    String? token,
  ) async {
    var response = await http.delete(
      Uri.parse('$BASE_URL/api/deletDonasi/$id'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'token': '$token'
      },
    );
    var responseDeletDonasi = json.decode(response.body);
    return ResponseDeletDonasi.fromJson(responseDeletDonasi);
  }

  //add struck donasi
  Future<ResponseAddStrukDonasi> addStruckDonasiService(
    String token,
    int id,
    File? fileStruck,
  ) async {
    var stream = http.ByteStream(fileStruck!.openRead());
    Map<String, String> headers = {"token": '$token'};
    var fileLength = await fileStruck.length();
    var uri = Uri.parse('$BASE_URL/api/addStrukDonasi/$id');
    var request = await http.MultipartRequest("PUT", uri);
    request.files.add(http.MultipartFile('image', stream, fileLength,
        filename: fileStruck.path));
    request.headers.addAll(headers);
    var streamResponse = await request.send();
    var parseResponse = await http.Response.fromStream(streamResponse);
    var responseJson = json.decode(parseResponse.body);
    return ResponseAddStrukDonasi.fromJson(responseJson);
  }
}
