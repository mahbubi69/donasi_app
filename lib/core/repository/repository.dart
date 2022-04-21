import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:donasi_app/core/response/response_login_user.dart';
import 'package:donasi_app/core/service/service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repository extends Service {
  final ServiceUser apiServiceUser = ServiceUser();
  final storage = const FlutterSecureStorage();

  //logIn User
  Future<ResponseLoginUser> LoginRepo(String email, String password) async {
    return apiServiceUser.loginUserSevice(email, password);
  }

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
}
