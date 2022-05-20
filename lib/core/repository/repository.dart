import 'package:donasi_app/core/model/model_donasi.dart';
import 'package:donasi_app/core/model/model_program.dart';
import 'package:donasi_app/core/response/resp_donasi.dart';
import 'package:donasi_app/core/response/resp_program.dart';
import 'package:donasi_app/core/response/resp_edit_profile.dart';
import 'package:donasi_app/core/response/resp_profile_user.dart';
import 'package:donasi_app/core/response/resp_register_user.dart';
import 'package:donasi_app/core/response/resp_login_user.dart';
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

//get donasi
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
    String? tokenUser = prefToken;
    var map = await apiServiceUser.getReportDonasiService(tokenUser!);
    return ResponseDonasi.fromJson(map).data;
  }
}
