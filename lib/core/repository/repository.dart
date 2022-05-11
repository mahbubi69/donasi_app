import 'dart:developer';
import 'package:donasi_app/core/response/resp_register_user.dart';
import 'package:donasi_app/core/response/resp_login_user.dart';

import '../service/service.dart';

class Repository extends Service {
  final ServiceUser apiServiceUser = ServiceUser();

  //logIn
  // ignore: non_constant_identifier_names
  Future<ResponseLogin> LoginRepo(String email, String password) async {
    return apiServiceUser.loginUserServic(
      email,
      password,
    );
  }

  //register
  // ignore: non_constant_identifier_names
  Future<ResponseRegister> RegisterRepo(
    final String nama,
    final String email,
    final String password,
    final String role,
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
      alamat,
      jenisKelamin,
      tanggalLahir,
      noHp,
    );
  }
}
