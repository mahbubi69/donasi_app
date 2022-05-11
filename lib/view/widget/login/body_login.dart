// ignore_for_file: deprecated_member_use
import 'package:donasi_app/core/repository/repository.dart';
import 'package:donasi_app/view/widget/login/already_account_chek.dart';
import 'package:donasi_app/view/widget/navigation/navigation_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../../../colors/colors.dart';
import '../../../core/utils/value.dart';
import '../../screen/register_screen.dart';

class BodyLogin extends StatefulWidget {
  const BodyLogin({Key? key}) : super(key: key);

  @override
  State<BodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  String email = "", password = "";
  var logger = Logger();
  TextEditingController emailControll = TextEditingController();
  TextEditingController passwordControll = TextEditingController();
  final Repository repoUser = Repository();
  bool isObscure = true;

  @override
  void initState() {
    super.initState();
    emailControll = TextEditingController();
    passwordControll = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Login',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: pink,
                      height: 1),
                ),
                Image.asset(
                  'assets/icons/bg_register.png',
                  height: size.height * 0.40,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                //input email
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                      color: kprimary, borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    controller: emailControll,
                    validator: (value) =>
                        value!.contains('@') ? 'masukkan email' : null,
                    // onChanged: onChanged,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: pink,
                      ),
                      hintText: 'Email',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                //input password
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                      color: kprimary, borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    obscureText: isObscure,
                    controller: passwordControll,
                    // onChanged: onChanged,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          color: pink,
                          onPressed: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                        ),
                        icon: const Icon(
                          Icons.lock_outlined,
                          color: pink,
                        ),
                        hintText: 'Password',
                        border: InputBorder.none),
                  ),
                ),
                //button
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FlatButton(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      color: pink,
                      onPressed: () {
                        setState(
                          () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             const NavigationBarStyle()));
                            loginSubmit(email, password, context);
                          },
                        );
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                // chek akun
                AllReadyAccountChek(
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterScreen()));
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> loginSubmit(
      String email, String password, BuildContext context) async {
    String email = emailControll.value.text;
    String password = passwordControll.value.text;
    var response = await repoUser.LoginRepo(
      email,
      password,
    );
    logger.d(response.status);

    if (response.status == 200) {
      logger.d("Success Login");
      try {
        logger.d(response.token.toString());
        // writeSecureData('token', response.token!);
        sharedPrefendSetToken(response.token!);

        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const NavigationBarStyle(),
          ),
        );
      } catch (e) {
        print(e);
      }
    } else {
      showErrorDialog('Error', response.message);
    }
  }

  Future<void> showErrorDialog(String title, String message) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}
