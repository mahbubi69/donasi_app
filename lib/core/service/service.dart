import 'dart:convert';
import 'dart:io';

import 'package:donasi_app/core/response/resp_add_image_profile.dart';
import 'package:donasi_app/core/response/resp_delet_donasi.dart';
import 'package:donasi_app/core/response/resp_delet_image_profile.dart';
import 'package:donasi_app/core/response/resp_edit_password.dart';
import 'package:donasi_app/core/response/resp_edit_profile.dart';
import 'package:donasi_app/core/response/resp_login_user.dart';
import 'package:donasi_app/core/response/resp_register_user.dart';
import 'package:donasi_app/core/utils/value.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

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
    int id,
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

  // //add image profile
  // Future<ResponseEditImageProfile> editImageProfileService(
  //   String token,
  //   id,
  //   File fileImage,
  // ) async {
  //   // final file = await MultipartFile.fromFile(path, filename: 'test_file');
  //   var imgBytes = fileImage.readAsBytes();

  //   var response =
  //       await http.put(Uri.parse('$BASE_URL/api/addImageUser/$id'), headers: {
  //     'Content-type': 'application/json',
  //     'Accept': 'application/json',
  //     'token': '$token',
  //   }, body: {
  //     'image': imgBytes
  //   });

  //   var reponseEditImage = json.decode(response.body);
  //   return ResponseEditImageProfile.fromJson(reponseEditImage);
  // }

  //add image profile
  Future<ResponseEditImageProfile> editProfileImagSrvice(
    String token,
    id,
    File fileImage,
  ) async {
    var header = {
      'Content-type': 'multipart/form-data',
      // 'Accept': 'application/json',
      'token': '$token',
    };
    var request = http.MultipartRequest(
        'PUT', Uri.parse('$BASE_URL/api/addImageUser/$id'));

    request.files.add(await http.MultipartFile.fromPath(
        'image', fileImage.absolute.path.toString()));
    var streamResponse = await request.send();
    var parseResponse = await http.Response.fromStream(streamResponse);
    var response = json.decode(parseResponse.body);
    return ResponseEditImageProfile.fromJson(response);
  }

//add donasi
  // Future<ResponseDonasi> addDonasiService(
  //   int jumlahDonasi,
  //   idProgram,
  //   idUser,
  //   token,
  // ) async {
  //   var response = await http.post(Uri.parse('$BASE_URL/api/addDonasi'),
  //       headers: {
  //         'Content-type': 'application/json',
  //         'Accept': 'application/json',
  //         'token': '$token'
  //       },
  //       body: jsonEncode(
  //         <String, int>{
  //           "jumlah_donasi": jumlahDonasi,
  //           "program_id": idProgram,
  //           "user_id": idUser
  //         },
  //       ));
  //   var responseDonasi = json.decode(response.body);
  //   return ResponseDonasi.fromJson(responseDonasi);
  // }

  //delet donasi
  Future<ResponseDeletDonasi> deletDonasiService(
    String? token,
    id,
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

  //delet image profile
  Future<ResponseDeletImageProfile> deletImgProfilService(
    String token,
    id,
  ) async {
    var response = await http.delete(
      Uri.parse('$BASE_URL/api/deletUser/$id'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'token': '$token'
      },
    );
    var responseDeltImgProfile = json.decode(response.body);
    return ResponseDeletImageProfile.fromJson(responseDeltImgProfile);
  }
}
