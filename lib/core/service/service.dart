import 'dart:convert';

import 'package:donasi_app/core/response/response_login_user.dart';
import 'package:http/http.dart' as http;

class ServiceUser {
  String BASE_URL = 'https://ee1f-180-253-164-224.ngrok.io';
  //login user
  Future<ResponseLoginUser> loginUserSevice(
      String email, String password) async {
    var response = await http.post(
      Uri.parse("$BASE_URL/api/loginUser"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );

    return ResponseLoginUser.fromJson(json.decode(response.body));
  }
}
