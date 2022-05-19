import 'dart:developer';
import 'package:donasi_app/core/model/model_donasi.dart';
import 'package:donasi_app/core/response/resp_donasi.dart';
import 'package:donasi_app/core/response/resp_profile_user.dart';
import 'package:donasi_app/core/response/resp_register_user.dart';
import 'package:donasi_app/core/response/resp_login_user.dart';

import '../service/service.dart';

class Repository extends Service {
  final ServiceUser apiServiceUser = ServiceUser();

  //logIn
  // ignore: non_constant_identifier_names
  Future<ResponseLogin> loginRepo(String email, String password) async {
    return apiServiceUser.loginUserService(
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
  Future<ResponseProfileUser> getProfileRepo(int id, String token) async {
    var map = await getProfileService(id, token);
    return ResponseProfileUser.fromJson(map);
  }

//get donasi
  Future<List<Program>> getProgramRepo() async {
    var map = await getProgramService();
    return ResponseProgram.fromJson(map).data;
  }
}
