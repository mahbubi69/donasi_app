import 'dart:io';

import 'package:donasi_app/core/model/model_donasi.dart';
import 'package:donasi_app/core/model/model_program.dart';
import 'package:donasi_app/core/response/resp_add_image_profile.dart';
import 'package:donasi_app/core/response/resp_add_struck_donasi.dart';
import 'package:donasi_app/core/response/resp_delet_donasi.dart';
import 'package:donasi_app/core/response/resp_delet_image_profile.dart';
import 'package:donasi_app/core/response/resp_add_donasi.dart';
import 'package:donasi_app/core/response/resp_edit_password.dart';
import 'package:donasi_app/core/response/resp_program.dart';
import 'package:donasi_app/core/response/resp_edit_profile.dart';
import 'package:donasi_app/core/response/resp_profile_user.dart';
import 'package:donasi_app/core/response/resp_register_user.dart';
import 'package:donasi_app/core/response/resp_login_user.dart';
import 'package:donasi_app/core/response/resp_report_donasi.dart';
import 'package:donasi_app/core/service/service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repository extends ServiceUser {
  final ServiceUser apiServiceUser = ServiceUser();

  //logIn
  // ignore: non_constant_identifier_names
  // on exstend useer service
  Future<ResponseLogin> loginRepo(String email, String password) async {
    return loginUserService(
      email,
      password,
    );
  }

  //register
  // ignore: non_constant_identifier_names
  Future<ResponseRegister> registerRepo(
    final String nama,
    final String email,
    final String password,
    final String role,
    final String image,
    final String alamat,
    final String jenisKelamin,
    final String tanggalLahir,
    final String noHp,
  ) {
    return apiServiceUser.registerUser(
      nama,
      email,
      password,
      role,
      image,
      alamat,
      jenisKelamin,
      tanggalLahir,
      noHp,
    );
  }

//get profile
//off exstend user service
  Future<ResponseProfileUser> getProfileRepo(int id, String token) async {
    var map = await apiServiceUser.getProfileService(id, token);
    return ResponseProfileUser.fromJson(map);
  }

//get program
  Future<List<Program>> getProgramRepo() async {
    final prefs = await SharedPreferences.getInstance();
    var prefToken = prefs.getString('Token');
    String? tokenUser = prefToken;
    var map = await apiServiceUser.getProgramService(tokenUser!);
    return ResponseProgram.fromJson(map).data;
  }

//edit profile
  Future<ResponseEditProfile> editProfilerepo(
    final String nama,
    alamat,
    tanggalLahir,
    noHp,
    id,
    token,
  ) async {
    return apiServiceUser.editProfileService(
        nama, alamat, tanggalLahir, noHp, id, token);
  }

  //get donasi
  Future<List<Donasi>> getReportDonasiRepo() async {
    final prefs = await SharedPreferences.getInstance();
    var prefToken = prefs.getString('Token');
    var prefid = prefs.getInt('Id');
    int? id = prefid;

    String? tokenUser = prefToken;
    var map = await apiServiceUser.getReportDonasiService(tokenUser!, id!);
    return ResponseReportDonasi.fromJson(map).data;
  }

  //edit password
  Future<ResponseEditPassword> editPasswordRepo(
    String password,
    id,
    token,
  ) async {
    return apiServiceUser.editPasswordService(token, id, password);
  }

  //edit image profile
  Future<ResponseEditImageProfile> editImageProfileRepo(
    String token,
    id,
    File filePathImage,
  ) async {
    return apiServiceUser.editProfileImagSrvice(token, id, filePathImage);
  }

  // add Donasi
  Future<ResponseAddDonasi> addDonasiRepo(
    int jumlahDonasi,
    idProgram,
    idUser,
    String token,
  ) async {
    return apiServiceUser.addDonasiService(
        jumlahDonasi, idProgram, idUser, token);
  }

  //delet donasi
  Future<ResponseDeletDonasi> deletDonsiRepo(
    String token,
    id,
  ) async {
    return apiServiceUser.deletDonasiService(
      id,
      token,
    );
  }

//delet img profile
  Future<ResponseDeletImageProfile> deletImgProfileRepo(
    String token,
    id,
  ) async {
    return apiServiceUser.deletImgProfilService(token, id);
  }

  //add struck donasi
  Future<ResponseAddStrukDonasi> addStruckDonasi(
    String token,
    int id,
    File? fileStruck,
  ) async {
    return apiServiceUser.addStruckDonasiService(token, id, fileStruck);
  }
}
